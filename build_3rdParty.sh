#!/bin/sh
# Create image for 3rdParty devices

# MXIII
# Specs: Amlogic S802 SoC, 1 GB RAM, 10/100 Mbps LAN, AP6330 WiFi
PROJECT=Minix-S8X2 DEVICE=MXIII-1G ARCH=arm make image -j8

# MXIII Plus / G
# Specs: Amlogic S812 SoC, 2 GB RAM, Gigabit LAN, AP6234 WiFi
PROJECT=Minix-S8X2 DEVICE=MXIII-Plus ARCH=arm make image -j8

# MINIX Neo X8-H Plus
# Specs: Amlogic S812-H SoC, 2 GB RAM, 10/100 Mbps LAN, AP6335e WiFi
PROJECT=Minix-S8X2 DEVICE=X8H-Plus ARCH=arm make image -j8

# Universal build for multiple n200-based S812 TV boxes
# Specs: Amlogic S812 SoC, 2 GB RAM, 10/100 Mbps LAN, AP6330 WiFi
PROJECT=Minix-S8X2 DEVICE=n200-AP6330_2G ARCH=arm make image -j8

# WeTek Core (Semi-official)
# Specs: Amlogic S812-H SoC, 2 GB RAM, Gigabit LAN, AP6330 WiFi
PROJECT=WeTek_Core ARCH=arm make image -j8

# MXQ S85
# Specs: Amlogic S805 SoC, 1 GB RAM, 10/100 LAN, AP6210/AP6212 WiFi
PROJECT=S805 DEVICE=MXQ ARCH=arm make image -j8

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system
