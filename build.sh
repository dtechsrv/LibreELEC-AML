#!/bin/sh
# Create image for supported devices

# Mecool/Videostrong KI Pro (gxl_p230_k1_pro)
# Specs: Amlogic S905D SoC, 2 GB RAM, 16 GB eMMC, 1 Gbps Ethernet (RTL8211F),
# Tested and works on PCB: 'K3_DVB_DDR4-V1.2', wireless module: ap6255.
PROJECT=S905 DEVICE=KI-Pro ARCH=arm make image -j8

# Videostrong KI Plus (gxbb_p200_k1_plus)
# Specs: Amlogic S905 SoC, 1 GB RAM, 8 GB eMMC, 10/100 Mbps Ethernet (IC+ IP101GR),
# Tested and works on PCB: 'K1_S905_REV2.2', wireless module: rtl8189es.
PROJECT=S905 DEVICE=KI-Plus ARCH=arm make image -j8

# WeTek Play 2 (gxbb_p200_2G_wetek_play_2)
# Specs: Amlogic S905-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F),
# Tested and works on PCB: 'WeTek Play2 V1.2', wireless module: ap6330.
PROJECT=S905 DEVICE=WeTek_Play_2 ARCH=arm make amlpkg -j8

# MXQ 4K Pro+ (gxl_p212_2g_nand)
# Specs: Amlogic S905X SoC, 2 GB RAM, 16 GB eMMC, 10/100 Mbps Ethernet (IC+ IP101GR),
# Tested and works with wireless module: bcm4334b1.
PROJECT=S905 DEVICE=MXQ-4K-Pro_2G ARCH=arm make image -j8

# OTT M8S+ (m8m2_KII)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F),
# Tested and works on PCB: 'S812_M8_REV1.1 15/05/21', wireless module: ap6330 or bcm4335b0.
PROJECT=S8X2 DEVICE=M8S-Plus ARCH=arm make image -j8

# WeTek Core (m8m2_n200C_2G)
# Specs: Amlogic S812-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet.
# Tested and works on PCB: 'WeTek_Core V1.0', wireless module: ap6330.
PROJECT=WeTek_Core ARCH=arm make amlpkg -j8

# MXQ HD18Q "all black" boxes (m8b_m201_v1)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),
# Tested and works on PCB: M8S-S805, M8Q labeled board in an M8 case.
PROJECT=S805 DEVICE=HD18Q ARCH=arm make image -j8

# MXQ m201d with 512 MB RAM only (m8b_m201C_512M)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),
# Tested and works on PCB: 'S805 Rev2.0 20150806'.
PROJECT=S805 DEVICE=m201d ARCH=arm make image -j8

# WeTek Play (AML8726-MX, meson6 without dt-id)
# Specs: Amlogic M6 SoC, 1 GB RAM, 4 GB NAND Flash, 10/100 Mbps Ethernet (SMSC LAN8720A),
# Tested and works on WeTek Play OpenELEC Edition box.
PROJECT=WeTek_Play ARCH=arm make amlpkg -j8

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system
