#!/bin/sh
# Create image for supported devices

# WeTek Play 2 (gxbb_p200_2G_wetek_play_2)
# Specs: Amlogic S905-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6330 WiFi.
PROJECT=S905 DEVICE=WeTek_Play_2 ARCH=arm make amlpkg -j$(nproc)

# WeTek Hub (gxbb_p200_1G_wetek_hub)
# Specs: Amlogic S905-H SoC, 1 GB RAM, 8 GB eMMC, 1 Gbps Ethernet (RTL8211F), AP6255 WiFi.
PROJECT=S905 DEVICE=WeTek_Hub ARCH=arm make amlpkg -j$(nproc)

# Generic image for S905 (gxbb*) and S905X/W/D boxes (gxl*)
# Specs: Amlogic S905x SoC, 1 or 2 GB RAM, 8 GB or more eMMC, multiple Ethernet and WiFi chips.
PROJECT=S905 DEVICE=Generic_S905 ARCH=arm make image -j$(nproc)

# Generic image for S912 boxes (gxm*)
# Specs: Amlogic S912 SoC, 2 or 3 GB RAM, 8 GB or more eMMC, multiple Ethernet and WiFi chips.
PROJECT=S912 DEVICE=Generic_S912 ARCH=arm make image -j$(nproc)

# OTT M8S+ and Videostrong KII (m8m2_KII)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F), AP6330 or BCM4335B0 WiFi.
PROJECT=S8X2 DEVICE=M8S-Plus ARCH=arm make amlpkg -j$(nproc)

# WeTek Core (m8m2_n200C_2G)
# Specs: Amlogic S812-H SoC, 2 GB RAM, 8 GB eMMC, 1 Gbps Ethernet, AP6330 WiFi.
PROJECT=S8X2 DEVICE=WeTek_Core ARCH=arm make amlpkg -j$(nproc)

# MXQ HD18Q "all black" boxes (m8b_m201_v1)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet, Broadcom or Realtek WiFi.
PROJECT=S805 DEVICE=HD18Q ARCH=arm make amlota -j$(nproc)

# MXQ m201d with 512 MB RAM only (m8b_m201C_512M)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet, Broadcom or Realtek WiFi.
PROJECT=S805 DEVICE=m201d ARCH=arm make amlota -j$(nproc)

# Generic image for S805 boxes, with multi-dtb (m8b_m201_1G, m8b_m201C_512M)
# Specs: Amlogic S805 SoC, 1 GB or 512 MB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet, Broadcom or Realtek WiFi.
PROJECT=S805 DEVICE=Generic_S805 ARCH=arm make amlota -j$(nproc)

# WeTek Play (AML8726-MX, meson6 without dt-id)
# Specs: Amlogic M6 SoC, 1 GB RAM, 4 GB NAND Flash, 10/100 Mbps Ethernet (SMSC LAN8720A), AP6210 WiFi.
PROJECT=WeTek_Play ARCH=arm make amlpkg -j$(nproc)

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system
