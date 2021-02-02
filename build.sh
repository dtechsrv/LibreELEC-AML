#!/bin/sh

# Create image for Mecool/Videostrong KI Pro (gxl_p230_k1_pro)
# Specs: Amlogic S905D SoC, 2 GB MB RAM, 16 GB NAND Flash, 1 Gbps Ethernet (RTL8211F)
# Tested and works on PCB: 'K3_DVB_DDR4-V1.2', wireless module: ap6255.
DISTRO=LibreELEC PROJECT=S905 DEVICE=KI-Pro ARCH=arm make image -j8
