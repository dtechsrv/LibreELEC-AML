# OTT M8S* Edition

Unofficial community sources and firmware binaries for some Amlogic S805 and S812 based devices.

**Currently supported devices:**

- S8X2/M8S+ (with ap6330 and bcm4335b0 wireless modules),<br />
*Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F),*
- S8X2/M8S (with 'CS_812M8_V1.3 20150921' PCB only),<br />
*Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),*
- S805/M8Q (a.k.a. M8S-S805),<br />
*Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),*
- S805/m201d (a.k.a. MXQ with 512MB RAM only),<br />
*Amlogic S805 SoC, 512 MB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR).*

This repository is based on [S802-LE/LibreELEC.tv](https://github.com/S802-LE/LibreELEC.tv).

# How to start, install and update the firmware

**Start LibreELEC from SD Card**

If you want to boot the device from an SD Card, you need to perform the toothpick method: disconnect the power plug, insert the prepared SD Card on, which the image file is written (img.gz), and then press and hold the reset button located behind the A/V connector. Wait for the LibreELEC logo to appear before releasing the button.

**Install image from SD Card to internal memory (eMMC or onboard NAND Flash)**

If you want to install the firmware into the internal memory, you need to log in to the device via SSH and run the 'installtointernal' command. The default password for the root user is 'LibreELEC'.

*NOTICE: The command will completely overwrite the previously installed firmware, so it will no longer be possible to boot the originally installed system.*

**Install an update package**

To install the update, you must copy the 'tar' file to the Update folder via SMB, and then restart the device. The update process will start automatically after the restart.

# LibreELEC

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](http://openelec.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](https://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](https://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Freenode.

**Donations**

Contributions towards current project funding goals can be sent via PayPal to donations@libreelec.tv

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project, unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
