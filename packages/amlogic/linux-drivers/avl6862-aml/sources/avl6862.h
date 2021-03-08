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

#ifndef AVL6862_H
#define AVL6862_H

#include <linux/dvb/frontend.h>
#include "dvb_frontend.h"

#define MAX_CHANNEL_INFO 256
#if 0
typedef struct s_DVBTx_Channel_TS
{
    // number, example 474*1000 is RF frequency 474MHz.
    int channel_freq_khz;
    // number, example 8000 is 8MHz bandwith channel.
    int channel_bandwith_khz;

    u8 channel_type;
    // 0 - Low priority layer, 1 - High priority layer
    u8 dvbt_hierarchy_layer;
    // data PLP id, 0 to 255; for single PLP DVBT2 channel, this ID is 0; for DVBT channel, this ID isn't used.
    u8 data_plp_id;
    u8 channel_profile;
}s_DVBTx_Channel_TS;
#endif
struct avl6862_priv {
	struct i2c_adapter *i2c;
 	struct avl6862_config *config;
	struct dvb_frontend frontend;
	enum fe_delivery_system delivery_system;

	/* DVB-Tx */
	u16 g_nChannel_ts_total;
//	s_DVBTx_Channel_TS global_channel_ts_table[MAX_CHANNEL_INFO];
};

struct avl6862_config {
	int		i2c_id; // i2c adapter id
	void	*i2c_adapter; // i2c adapter
	u8		demod_address; // demodulator i2c address
	u8		tuner_address; // tuner i2c address
	unsigned char eDiseqcStatus;
};

extern struct dvb_frontend *avl6862_attach(struct avl6862_config *config, struct i2c_adapter *i2c);
extern struct dvb_frontend *avl6862x_attach(struct avl6862_config *config, struct i2c_adapter *i2c);

#endif /* AVL6862_H */
