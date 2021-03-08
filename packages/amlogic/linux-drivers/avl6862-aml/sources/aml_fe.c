/*

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

*/

#ifndef CONFIG_ARM64
#include <mach/am_regs.h>
#else
#include <linux/reset.h>
#endif
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/firmware.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/i2c.h>
#include <linux/version.h>
#include <linux/amlogic/aml_gpio_consumer.h>
#include <linux/platform_device.h>

#include "aml_fe.h"

#include "avl6862.h"
#include "r848a.h"

#include "aml_dvb.h"
#undef pr_err

#define pr_dbg(fmt, args...) \
	do {\
		if (debug_fe)\
			printk("DVB FE: " fmt, ##args);\
	} while (0)
#define pr_err(fmt, args...) printk("DVB FE: " fmt, ## args)
#define pr_inf(fmt, args...)   printk("DVB FE: " fmt, ## args)

MODULE_PARM_DESC(debug_fe, "\n\t\t Enable frontend debug information");
static int debug_fe;
module_param(debug_fe, int, 0644);

MODULE_PARM_DESC(frontend_power, "\n\t\t Power GPIO of frontend");
static int frontend_power = -1;
module_param(frontend_power, int, 0644);

MODULE_PARM_DESC(frontend_reset, "\n\t\t Reset GPIO of frontend");
static int frontend_reset = -1;
module_param(frontend_reset, int, 0644);

static struct aml_fe avl6862_fe[FE_DEV_COUNT];

static char *device_name = "avl6862";

#if 1
static struct r848_config r848_config = {
	.i2c_address = 0x7A,	
};
#endif

static struct avl6862_config avl6862_config = {
	.demod_address = 0x14,
	.tuner_address = 0x7A,
};

int avl6862_Reset(void)
{	
	pr_dbg("avl6862_Reset!\n");
	
	gpio_request(frontend_reset,device_name);
	gpio_direction_output(frontend_reset, 0);
	msleep(600);
	gpio_request(frontend_reset,device_name);
	gpio_direction_output(frontend_reset, 1);
	msleep(200);
	
	return 0;
}

int avl6862_gpio(void)
{
	pr_dbg("avl6862_gpio!\n");
	
	gpio_request(frontend_power,device_name);
	gpio_direction_output(frontend_power, 1);
	
	return 0;
}

static int avl6862_fe_init(struct aml_dvb *advb, struct platform_device *pdev, struct aml_fe *fe, int id)
{
	struct dvb_frontend_ops *ops;
	int ret, i2c_adap_id = 1;

	struct i2c_adapter *i2c_handle;
#ifdef CONFIG_ARM64
        struct gpio_desc *desc;
	int gpio_reset, gpio_power;
#endif
	
	pr_inf("Init AVL6862 frontend %d\n", id);
	
#ifdef CONFIG_OF
	if (of_property_read_u32(pdev->dev.of_node, "dtv_demod0_i2c_adap_id", &i2c_adap_id)) {
		ret = -ENOMEM;
		goto err_resource;
	}
	pr_dbg("i2c_adap_id=%d\n", &i2c_adap_id);
	desc = of_get_named_gpiod_flags(pdev->dev.of_node, "dtv_demod0_reset_gpio-gpios", 0, NULL);
	gpio_reset = desc_to_gpio(desc);
	pr_dbg("gpio_reset=%d\n", gpio_reset);
	
	desc = of_get_named_gpiod_flags(pdev->dev.of_node, "dtv_demod0_power_gpio-gpios", 0, NULL);
	gpio_power = desc_to_gpio(desc);
	pr_dbg("gpio_power=%d\n", gpio_power);
#endif /*CONFIG_OF*/

	frontend_reset = gpio_reset;
	frontend_power = gpio_power;
	i2c_handle = i2c_get_adapter(i2c_adap_id);

	if (!i2c_handle) {
		pr_err("Cannot get i2c adapter for id:%d! \n", i2c_adap_id);
		ret = -ENOMEM;
		goto err_resource;
	}
	
	avl6862_Reset();
	avl6862_gpio();
	fe->fe = dvb_attach(avl6862_attach, &avl6862_config, i2c_handle);

	if (!fe->fe) {
		pr_err("avl6862_attach attach failed!!!\n");
		ret = -ENOMEM;
		goto err_resource;
	}
		
	if (dvb_attach(r848x_attach, fe->fe, &r848_config, i2c_handle) == NULL) {
		dvb_frontend_detach(fe->fe);
		fe->fe = NULL;
		pr_err("r848_attach attach failed!!!\n");
		ret = -ENOMEM;
		goto err_resource;
	}

	pr_inf("AVL6862 and R848 attached!\n");

	if ((ret=dvb_register_frontend(&advb->dvb_adapter, fe->fe))) {
		pr_err("Frontend avl6862 registration failed!!!\n");
		ops = &fe->fe->ops;
		if (ops->release != NULL)
			ops->release(fe->fe);
		fe->fe = NULL;
		ret = -ENOMEM;
		goto err_resource;
	}
	

	pr_inf("Frontend AVL6862 registred!\n");
	
	return 0;

err_resource:
	return ret;
}

static int avl6862_fe_probe(struct platform_device *pdev)
{
	int ret = 0;

	struct aml_dvb *dvb = aml_get_dvb_device();

	if(avl6862_fe_init(dvb, pdev, &avl6862_fe[0], 0)<0)
		return -ENXIO;

	platform_set_drvdata(pdev, &avl6862_fe[0]);

	return ret;
}

static void avl6862_fe_release(struct aml_dvb *advb, struct aml_fe *fe)
{
	if(fe && fe->fe) {
                dvb_unregister_frontend(fe->fe);
                dvb_frontend_detach(fe->fe);
	}
}

static int avl6862_fe_remove(struct platform_device *pdev)
{
        struct aml_fe *drv_data = platform_get_drvdata(pdev);
        struct aml_dvb *dvb = aml_get_dvb_device();

	platform_set_drvdata(pdev, NULL);
	avl6862_fe_release(dvb, drv_data);

	return 0;
}

static int avl6862_fe_resume(struct platform_device *pdev)
{
	pr_dbg("avl6862_fe_resume \n");
	return 0;
}

static int avl6862_fe_suspend(struct platform_device *pdev, pm_message_t state)
{
	pr_dbg("avl6862_fe_suspend \n");
	return 0;
}

#ifdef CONFIG_OF
static const struct of_device_id aml_fe_dt_match[]={
        {
                .compatible = "amlogic,dvbfe",
        },
        {},
};
#endif /*CONFIG_OF*/

static struct platform_driver aml_fe_driver = {
        .probe = avl6862_fe_probe,
        .remove = avl6862_fe_remove,
        .resume = avl6862_fe_resume,
        .suspend = avl6862_fe_suspend,
        .driver = {
    	.name = "avl6862",
        .owner = THIS_MODULE,
#ifdef CONFIG_OF
        .of_match_table = aml_fe_dt_match,
#endif
        }
};

static int __init avlfrontend_init(void) {
	 return platform_driver_register(&aml_fe_driver);
}

static void __exit avlfrontend_exit(void) {
        platform_driver_unregister(&aml_fe_driver);
}

module_init(avlfrontend_init);
module_exit(avlfrontend_exit);
MODULE_AUTHOR("afl1");
MODULE_DESCRIPTION("AVL6862 DVB-Sx/Tx/C frontend driver");
MODULE_LICENSE("GPL");
