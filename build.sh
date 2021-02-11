#!/bin/sh

# Create image for Mecool/Videostrong KI Pro (gxl_p230_k1_pro)
# Specs: Amlogic S905D SoC, 2 GB MB RAM, 16 GB NAND Flash, 1 Gbps Ethernet (RTL8211F),
# Tested and works on PCB: 'K3_DVB_DDR4-V1.2', wireless module: ap6255.
PROJECT=S905 DEVICE=KI-Pro ARCH=arm make image -j8

# Create image for S8X2/M8S+ (m8m2_KII)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F),
# Tested and works on PCB: 'S812_M8_REV1.1 15/05/21', wireless module: ap6330 or bcm4335b0.
PROJECT=S8X2 DEVICE=M8S-Plus ARCH=arm make image -j8

# Create image for M8S-S805 (m8b_m201_1G)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR),
# Tested and works on PCB: M8S-S805, M8Q labeled board in an M8 case.
PROJECT=S805 DEVICE=M8Q ARCH=arm make image -j8

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system