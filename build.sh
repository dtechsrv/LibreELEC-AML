#!/bin/sh

# Create image for S8X2/M8S+ (Meson8m2_KII)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 1 Gbps Ethernet (RTL8211F)
# Works with both wireles modules: ap6330 and bcm4335b0 modudules too.
# Tested and works on PCB: 'S812_M8_REV1.1 15/05/21'.
# Power capabilities: power off only (suspend not supported by uboot).
DISTRO=LibreELEC PROJECT=S8X2 DEVICE=M8S-Plus ARCH=arm make image -j8

# Create image for S8X2/M8S (Meson8m2_n200C)
# Specs: Amlogic S812 SoC, 2 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR)
# Works with same dtb like M8S+ (m8m2_KII).
# Tested and works on PCB: 'CS_812M8_V1.3 20150921'.
# Power capabilities: suspend only (power off not supported by uboot).
DISTRO=LibreELEC PROJECT=S8X2 DEVICE=M8S ARCH=arm make image -j8

# Create image for M8S-S805 (Meson8b_m201_1G)
# Specs: Amlogic S805 SoC, 1 GB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR)
# Tested and works on PCB: M8S-S805, M8Q labeled board in an M8 case.
# Power capabilities: power off only (suspend not supported by uboot).
DISTRO=LibreELEC PROJECT=S805 DEVICE=M8Q ARCH=arm make image -j8

# Create image for S805/MXQ-m201d (Meson8b_m201C_512M)
# Specs: Amlogic S805 SoC, 512 MB RAM, 8 GB NAND Flash, 10/100 Mbps Ethernet (IC+ IP101GR)
# Tested and works on PCB: 'S805 Rev2.0 20150806'.
# Power capabilities: power off only (suspend not supported by uboot).
DISTRO=LibreELEC PROJECT=S805 DEVICE=m201d ARCH=arm make image -j8
