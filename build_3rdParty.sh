#!/bin/sh
# Create image for 3rdParty devices

# Universal build for multiple k200-based S802 TV boxes
# Specs: Amlogic S802 SoC, 2 GB RAM, 10/100 Mbps LAN, AP6330 or Realtek WiFi
PROJECT=S8X2 DEVICE=k200-AP6330_2G ARCH=arm make image -j8

# Universal build for multiple n200-based S812 TV boxes
# Specs: Amlogic S812 SoC, 2 GB RAM, 10/100 Mbps LAN, AP6330 or Realtek WiFi
PROJECT=S8X2 DEVICE=n200-AP6330_2G ARCH=arm make image -j8

# MXIII
# Specs: Amlogic S802 SoC, 1 GB RAM, 10/100 Mbps LAN, AP6330 WiFi
PROJECT=S8X2 DEVICE=MXIII-1G ARCH=arm make image -j8

# MXIII Plus / G
# Specs: Amlogic S812 SoC, 2 GB RAM, Gigabit LAN, AP6234 WiFi
PROJECT=S8X2 DEVICE=MXIII-Plus ARCH=arm make image -j8

# MINIX Neo X8 / X8-H
# Specs: Amlogic S802(-H) SoC, 2 GB RAM, 10/100 Mbps LAN, AP6330 WiFi
PROJECT=Minix-S8X2 DEVICE=X8-X8H ARCH=arm make image -j8

# MINIX Neo X8-H Plus
# Specs: Amlogic S812-H SoC, 2 GB RAM, Gigabit LAN, AP6335e WiFi
PROJECT=Minix-S8X2 DEVICE=X8H-Plus ARCH=arm make image -j8

# Odroid C1/C1+
# Specs: Amlogic S805 SoC, 1 GB RAM, Gigabit LAN, without WiFi
PROJECT=Odroid_C1 ARCH=arm make image -j8

# WeTek Hub
# Specs: Amlogic S905-H SoC, 1 GB RAM, Gigabit LAN, AP6335 or AP6255 WiFi
PROJECT=S905 DEVICE=WeTek_Hub ARCH=arm make amlpkg -j8

# MXQ S85
# Specs: Amlogic S805 SoC, 1 GB RAM, 10/100 LAN, AP6210/AP6212 WiFi
#PROJECT=S805 DEVICE=MXQ ARCH=arm make image -j8

# Remove unnecessary files after the build process
rm -rf target/*.kernel
rm -rf target/*.system
rm -rf target/*.initrd
