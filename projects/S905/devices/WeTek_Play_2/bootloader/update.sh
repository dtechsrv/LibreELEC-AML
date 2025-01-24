#!/bin/sh

# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-2023 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"

IMAGE_KERNEL="/flash/kernel.img"

for arg in $(cat /proc/cmdline); do
  case $arg in
    BOOT_IMAGE=*)
      IMAGE_KERNEL="${arg#*=}"
    ;;
  esac
done

mount -o remount,rw $BOOT_ROOT

if [ -b $IMAGE_KERNEL ]; then
  dd if="$SYSTEM_ROOT/usr/share/bootloader/dtb.img" of="/dev/dtb" bs=262144 2>&1
else
  cp -p $SYSTEM_ROOT/usr/share/bootloader/dtb.img $BOOT_ROOT
fi

sync
mount -o remount,ro $BOOT_ROOT

if [ -e /storage/.kodi/addons/repository.libreelec.tv ]; then
  echo "Removing outdated LibreELEC Add-ons update..."
  rm -rf /storage/.kodi/addons/repository.libreelec.tv
fi

if [ -e /storage/.kodi/addons/service.libreelec.settings ]; then
  echo "Removing outdated LibreELEC Configuration update..."
  rm -rf /storage/.kodi/addons/service.libreelec.settings
fi

if [ -e /storage/.kodi/addons/service.xonard ]; then
  echo "Removing obsolete Xonard service add-on..."
  rm -rf /storage/.kodi/addons/service.xonard
fi
