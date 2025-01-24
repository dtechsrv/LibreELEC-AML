#!/bin/sh

# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2022 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
[ -z "$UPDATE_DIR" ] && UPDATE_DIR="/storage/.update"

if [ -z "$BOOT_DISK" ]; then
  case $BOOT_PART in
    /dev/mmcblk*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
      ;;
  esac
fi

mount -o remount,rw $BOOT_ROOT

for all_dtb in $BOOT_ROOT/*.dtb; do
  dtb=$(basename $all_dtb)
  if [ -f "$SYSTEM_ROOT/usr/share/bootloader/$dtb" ]; then
    echo -n "Updating device tree: $dtb... "
    cp -p "$SYSTEM_ROOT/usr/share/bootloader/$dtb" "$BOOT_ROOT"
    echo "done"
  fi
done

if [ -f "$SYSTEM_ROOT/usr/share/bootloader/boot.ini" ]; then
  echo -n "Updating boot.ini... "
  cp -p "$SYSTEM_ROOT/usr/share/bootloader/boot.ini" "$BOOT_ROOT"
  echo "done"

  if [ -f "$SYSTEM_ROOT/usr/share/bootloader/config.ini" ]; then
    if [ ! -f "$BOOT_ROOT/config.ini" ]; then
      echo -n "Creating config.ini... "
      cp -p "$SYSTEM_ROOT/usr/share/bootloader/config.ini" "$BOOT_ROOT"
      echo "done"
    fi
  fi
fi

if [ -f $SYSTEM_ROOT/usr/share/bootloader/boot-logo.bmp.gz ]; then
  echo -n "Updating boot logo... "
  cp -p $SYSTEM_ROOT/usr/share/bootloader/boot-logo.bmp.gz $BOOT_ROOT
  echo "done"
fi

if [ -f $SYSTEM_ROOT/usr/share/bootloader/u-boot.bin -a -f $SYSTEM_ROOT/usr/share/bootloader/bl1.bin ]; then
  echo -n "Updating u-boot on $BOOT_DISK... "
  dd if=$SYSTEM_ROOT/usr/share/bootloader/bl1.bin of=$BOOT_DISK conv=fsync bs=1 count=442 status=none
  dd if=$SYSTEM_ROOT/usr/share/bootloader/bl1.bin of=$BOOT_DISK conv=fsync bs=512 seek=1 skip=1 status=none
  dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot.bin of=$BOOT_DISK conv=fsync bs=512 seek=64 status=none
  echo "done"
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
