# LibreELEC-AML

Unofficial community sources and firmware binaries for some Amlogic TV Boxes.

**Currently supported devices:**

- S905/KI-Pro (Mecool/Videostrong),<br />
*Amlogic S905D SoC, 2 GB RAM, 16 GB eMMC, 1 Gbps Ethernet (RTL8211F),*
- S905/KI-Plus (with S905 SoC only),<br />
*Amlogic S905 SoC, 1 GB RAM, 8 GB eMMC, 10/100 Mbps Ethernet (IC+ IP101GR),*
- S905/MXQ-4K-Pro_2G (MXQ 4K Pro+),<br />
*Amlogic S905X SoC, 2 GB RAM, 16 GB eMMC, 10/100 Mbps Ethernet (IC+ IP101GR),*
- S8X2/M8S+ (with ap6330 and bcm4335b0 wireless modules),<br />
*Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F),*
- WeTek Core (with ap6330 wireless module),<br />
*Amlogic S812-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F),*
- S805/HD18Q (MXQ "all black" versions),<br />
*Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),*
- S805/m201d (MXQ with 512 MB RAM only),<br />
*Amlogic S805 SoC, 512 MB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),*
- WeTek_Play (Meson6),<br />
*Amlogic AML8726-MX SoC, 1 GB RAM, 4 GB NAND Flash, 10/100 Mbps Ethernet (SMSC LAN8720A).*

This repository is based on [LibreELEC/LibreELEC.tv](https://github.com/LibreELEC/LibreELEC.tv).

# How to create bootable media, start, install and update the firmware

**Create bootable SD Card**

To create bootable SD card media you need to download the [LibreELEC USB-SD Creator](https://libreelec.tv/downloads_new/) tool from the LibreELEC website. Then click on the 'Select file' button and browse the previously downloaded 'img.gz' disk image.

**Start LibreELEC from SD Card**

If you want to boot the device from an SD Card, you need to perform the toothpick method: disconnect the power plug, insert the prepared SD Card on, which the image file is written (img.gz), and then press and hold the reset button. The reset button on MXQ and M8S+ is located behind the A/V connector, but on the KI Pro, the reset button is located behind the hole on the bottom of the device. Reconnect the power jack while holding down the reset button, then release it after about 3-5 seconds.

*NOTICE: If the Android recovery menu appeared, you pressed the button for too long.*

**Install image from SD Card to internal memory (eMMC or onboard NAND Flash)**

If you want to install the firmware into the internal memory, you need to log in to the device via SSH and run the 'installtointernal' command. The default password for the root user is 'libreelec'.

*NOTICE: The command will completely overwrite the previously installed firmware, so it will no longer be possible to boot the originally installed system.*

**Install an update package**

To install the update, you must copy the 'tar' file to the Update folder via SMB, and then restart the device. The update process will start automatically after the restart.

# LibreELEC

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](http://openelec.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](https://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](https://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Libera.Chat.

**Donations**

Contributions towards current project funding goals can be sent via PayPal to donations@libreelec.tv

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project, unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
