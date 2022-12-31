#!/bin/sh
# Create image for supported devices

# Mecool/Videostrong KI/KII-Pro/Plus series (gxbb, gxl)
PROJECT=S905 DEVICE=K_Series ARCH=arm make image -j8

# WeTek Play 2 (gxbb_p200_2G_wetek_play_2)
# Specs: Amlogic S905-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330 WiFi.
PROJECT=S905 DEVICE=WeTek_Play_2 ARCH=arm make amlpkg -j8

# OTT M8S+ (m8m2_KII)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F), AP6330 or BCM4335B0 WiFi.
PROJECT=S8X2 DEVICE=M8S-Plus ARCH=arm make image -j8

# WeTek Core (m8m2_n200C_2G)
# Specs: Amlogic S812-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet, AP6330 WiFi.
PROJECT=WeTek_Core ARCH=arm make amlpkg -j8

# MXQ HD18Q "all black" boxes (m8b_m201_v1)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR), Realtek WiFi.
PROJECT=S805 DEVICE=HD18Q ARCH=arm make image -j8

# MXQ m201d with 512 MB RAM only (m8b_m201C_512M)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR), Realtek WiFi.
PROJECT=S805 DEVICE=m201d ARCH=arm make image -j8

# WeTek Play (AML8726-MX, meson6 without dt-id)
# Specs: Amlogic M6 SoC, 1 GB RAM, 4 GB NAND Flash, 10/100 Mbps Ethernet (SMSC LAN8720A), AP6210 WiFi.
PROJECT=WeTek_Play ARCH=arm make amlpkg -j8

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system
