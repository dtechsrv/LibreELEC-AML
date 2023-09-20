# LibreELEC-AML - Long-Term Support (LTS)

Unofficial community sources and firmware binaries for some Amlogic TV Boxes. This repository is based on [LibreELEC/LibreELEC.tv](https://github.com/LibreELEC/LibreELEC.tv).

This project also maintains a binary addon repository and all the images are also available on the external website: [https://libreelec.dtech.hu/](https://libreelec.dtech.hu/).

**Issues & Support**

If you experience an issue, you can report it [here](https://github.com/dtechsrv/LibreELEC-AML/issues) or you can contact me for support in the [related topic](https://forum.libreelec.tv/thread/23456) on the LibreELEC forum.

**Donations**

At the moment this is a one-person project, so if you would like to support my work, you can do it via [PayPal](https://paypal.me/dtechsrv).

**License**

LibreELEC-AML, just like the LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

The same copyright applies to the modifications I made as to the original project (see below).

# Currently supported devices

- **Mecool/Videostrong KI/KII-Pro/Plus series *(gxbb\*, gxl\*)*:**<br />
Amlogic S905(-H) or S905D SoC, 1 or 2 GB RAM, 8 GB or more eMMC, multiple Ethernet and WiFi chips,
- **WeTek Play 2 *(gxbb_p200_2G_wetek_play_2)*:**<br />
Amlogic S905-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330 WiFi,
- **WeTek Hub *(gxbb_p200_1G_wetek_hub)*:**<br />
Amlogic S905-H SoC, 1 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330 WiFi,
- **Generic image for S905 *(gxbb\*)* and S905X/W/D boxes *(gxl\*)*:**<br />
Amlogic S905x SoC, 1 or 2 GB RAM, 8 GB or more eMMC, multiple Ethernet and WiFi chips,
- **Generic image for S912 boxes *(gxm\*)*:**<br />
Amlogic S912 SoC, 2 or 3 GB RAM, 8 GB or more eMMC, multiple Ethernet and WiFi chips,
- **OTT M8S+ and Videostrong KII *(m8m2_KII)*:**<br />
Amlogic S812 SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330/BCM4335B0 WiFi.
- **WeTek Core *(m8m2_n200C_2G)*:**<br />
Amlogic S812-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330 WiFi,
- **Generic image for S805 boxes, MXQ "all black" boxes: HD18Q *(m8b_m201_1G)*, m201d *(m8b_m201C_512M)*:**<br />
Amlogic S805 SoC, 1 GB or 512 MB RAM, 8 GB NAND, 10/100 Mbps Ethernet, Realtek WiFi,
- **WeTek Play *(AML8726-MX, meson6 without dt-id)*:**<br />
Amlogic M6 SoC, 1 GB RAM, 4 GB NAND, 10/100 Mbps Ethernet (SMSC LAN8720A), AP6212 WiFi.

***NOTICE:** Images for 3rdParty devices are only available from here: [https://libreelec.dtech.hu/images/3rdParty/](https://libreelec.dtech.hu/images/3rdParty/).*

# How to create bootable media, boot, install to NAND and update

1. **Create bootable media (SD card or USB flash drive):**<br />
To create bootable media you need to download the [LibreELEC-AML USB-SD Creator](https://github.com/dtechsrv/usb-sd-creator/releases) tool. Select the file you want to download and click the `Download` button, or click the `Select file` button and browse the previously downloaded disk image *(\*.img.gz)*.

***NOTICE:** Only the S905/S912 can boot from USB devices, the S805/S8X2 devices can only be booted from an SD card.*

2. **Boot LibreELEC from your previously prepared bootable media:**<br />
If you want to boot the device from your bootable media, you need to perform the toothpick method first: Disconnect the power plug, insert the prepared boot media, and then press and hold the reset button. Reconnect the power jack while holding down the reset button, then release it after about 3-5 seconds.

***NOTICE #1:** The reset button on MXQ and M8S+ is located behind the A/V connector, but on the Mecool and WeTek devices, the reset button is located behind the hole on the bottom of the device.*<br />
***NOTICE #2:** If the Android recovery menu appeared, you pressed the button for too long.*

3. **Install image from bootable media to internal NAND/eMMC:**<br />
If you want to install the image into the internal memory, you need to log in via SSH and run the `installtointernal` command.

***NOTICE:** The default password for the root user is `libreelec`.*

`IMPORTANT NOTICE:`<br />
`It completely overwrites the old OS *(e.g. Android)*, so it is no longer possible to boot that system!`

4. **NAND install image for SD card:**<br />
Download the NAND install image *(\*-sdcard.zip)*, extract it, and copy the contents of the file to the root folder of an FAT32-formatted SD card. Disconnect the power cord from the device, insert the prepared SD card, and plug in the power jack while pressing the reset button. You need to hold the button about 8-10 seconds until the LibreELEC installation begins.

***NOTICE:** The reset button on M8S+ is located behind the A/V connector, but on the Mecool and WeTek devices, the reset button is located behind the hole on the bottom of the device.*

`IMPORTANT NOTICE:`<br />
`It completely overwrites the old OS *(e.g. Android)*, so it is no longer possible to boot that system!`

5. **Install an update package:**<br />
To install the update, you need to download, and then copy the update file *(\*.tar)* to the Update folder via SMB, and then restart the device. The update process will start automatically after the restart.

# LibreELEC

***NOTICE:** This section is a copy from the original project, but the information may have changed over time. The current version is available [here](https://github.com/LibreELEC/LibreELEC.tv/blob/master/README.md).*

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](https://github.com/OpenELEC/OpenELEC.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](https://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](https://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Libera.Chat.

**Donations**

Contributions towards current project funding goals can be made via [OpenCollective](https://opencollective.com/libreelec/donate).

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project, unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
