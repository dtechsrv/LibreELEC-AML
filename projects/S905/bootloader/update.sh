#!/bin/sh

# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2023 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$UPDATE_DIR" ] && UPDATE_DIR="/storage/.update"

UPDATE_DTB_IMG="$UPDATE_DIR/dtb.img"
UPDATE_DTB="$(ls -1 "$UPDATE_DIR"/*.dtb 2>/dev/null | head -n 1)"

[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
if [ -z "$BOOT_DISK" ]; then
  case $BOOT_PART in
    /dev/sd[a-z][0-9]*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
      ;;
    /dev/mmcblk*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
      ;;
  esac
fi

mount -o remount,rw $BOOT_ROOT

for arg in $(cat /proc/cmdline); do
  case $arg in
    boot=*)
      boot="${arg#*=}"
      case $boot in
        /dev/mmc*)
          BOOT_UUID="$(blkid $boot | sed 's/.* UUID="//;s/".*//g')"
          ;;
        UUID=*|LABEL=*)
          BOOT_UUID="$(blkid | sed 's/"//g' | grep -m 1 -i " $boot " | sed 's/.* UUID=//;s/ .*//g')"
          ;;
      esac

      if [ -f "/proc/device-tree/le-dt-id" ] ; then
        LE_DT_ID=$(cat /proc/device-tree/le-dt-id)
      fi

      if [ -f "$UPDATE_DTB_IMG" ] ; then
        UPDATE_DTB_SOURCE="$UPDATE_DTB_IMG"
      elif [ -f "$UPDATE_DTB" ] ; then
        UPDATE_DTB_SOURCE="$UPDATE_DTB"
      elif [ -n "$LE_DT_ID" -a -f "$SYSTEM_ROOT/usr/share/bootloader/device_trees/$LE_DT_ID.dtb" ] ; then
        UPDATE_DTB_SOURCE="$SYSTEM_ROOT/usr/share/bootloader/device_trees/$LE_DT_ID.dtb"
      fi

      if [ -f "$UPDATE_DTB_SOURCE" ] ; then
        echo "Updating device tree from $UPDATE_DTB_SOURCE..."
        case $boot in
          /dev/system)
            dd if=/dev/zero of=/dev/dtb bs=256k count=1 status=none
            dd if="$UPDATE_DTB_SOURCE" of=/dev/dtb bs=256k status=none
            ;;
          /dev/mmc*|LABEL=*|UUID=*)
            cp -f "$UPDATE_DTB_SOURCE" "$BOOT_ROOT/dtb.img"
            ;;
        esac
      fi

      for all_dtb in /flash/*.dtb ; do
        if [ -f $all_dtb ] ; then
          dtb=$(basename $all_dtb)
          if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
            echo "Updating $dtb..."
            cp -p $SYSTEM_ROOT/usr/share/bootloader/$dtb $BOOT_ROOT
          fi
        fi
      done
      ;;

    disk=*)
      disk="${arg#*=}"
      case $disk in
        /dev/mmc*)
          DISK_UUID="$(blkid $disk | sed 's/.* UUID="//;s/".*//g')"
          ;;
        UUID=*|LABEL=*)
          DISK_UUID="$(blkid | sed 's/"//g' | grep -m 1 -i " $disk " | sed 's/.* UUID=//;s/ .*//g')"
          ;;
      esac
      ;;
  esac
done

if [ -d $BOOT_ROOT/device_trees ]; then
  rm $BOOT_ROOT/device_trees/*.dtb
  cp -p $SYSTEM_ROOT/usr/share/bootloader/device_trees/*.dtb $BOOT_ROOT/device_trees/
fi

if [ -d $BOOT_ROOT/openvfd_confs ]; then
  rm $BOOT_ROOT/openvfd_confs/*.conf
  cp -p $SYSTEM_ROOT/usr/share/bootloader/openvfd_confs/*.conf $BOOT_ROOT/openvfd_confs/
fi

if [ -f $SYSTEM_ROOT/usr/share/bootloader/u-boot.bin -a ! -e /dev/system -a ! -e /dev/boot ]; then
  echo "Updating u-boot on: $BOOT_DISK..."
  dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot.bin of=$BOOT_DISK conv=fsync bs=1 count=112 status=none
  dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot.bin of=$BOOT_DISK conv=fsync bs=512 skip=1 seek=1 status=none
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
