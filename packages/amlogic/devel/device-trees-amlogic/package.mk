# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="device-trees-amlogic"
PKG_VERSION="e1205e9"
PKG_SHA256="c5878cef9ed86b09bd29525e5bbc19f50a8fd6af1c70d34d4c2d66b78c4db9b4"
PKG_LICENSE="GPL"
PKG_URL="https://github.com/kszaq/s905-device-trees/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Device trees for Amlogic devices."
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

make_target() {
  # Enter kernel directory
  pushd $BUILD/linux-$(kernel_version) > /dev/null

  # Device trees already present in kernel tree we want to include
  EXTRA_TREES=( \
                gxbb_p201 gxbb_p200_1G_wetek_hub gxbb_p200_2G_wetek_play_2 \
                gxl_p212_1g gxl_p212_2g gxl_p212_1g_lepotato gxl_p212_2g_lepotato \
                gxl_p281_1g gxl_p281_2g gxm_q200_2g gxm_q201_1g gxm_q201_2g \
              )

  # Add trees to the list
  for f in ${EXTRA_TREES[@]}; do
    DTB_LIST="$DTB_LIST $f.dtb"
  done

  # Copy all device trees to kernel source folder and create a list
  cp -f $PKG_BUILD/*.dts* arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/
  for f in $PKG_BUILD/*.dts; do
    DTB_NAME="$(basename $f .dts).dtb"
    DTB_LIST="$DTB_LIST $DTB_NAME"
  done

  # Filter device tree list depending on project
  case "$PROJECT" in
    S905)
      for f in ${DTB_LIST[@]}; do
        [[ "$f" == gxbb* ]] || [[ "$f" == gxl* ]] && DTB_LIST_FILTERED="$DTB_LIST_FILTERED $f"
      done
      ;;
    S912)
      for f in ${DTB_LIST[@]}; do
        [[ "$f" == gxm* ]] && DTB_LIST_FILTERED="$DTB_LIST_FILTERED $f"
      done
      ;;
    *)
      for f in ${DTB_LIST[@]}; do
        if listcontains "$KERNEL_UBOOT_EXTRA_TARGET" "$f"; then
          DTB_LIST_FILTERED="$DTB_LIST_FILTERED $f"
        fi
      done
      ;;
  esac

  # Compile device trees
  kernel_make $DTB_LIST_FILTERED
  mv arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/*.dtb $PKG_BUILD

  popd > /dev/null
}

makeinstall_target() {
  case "$PROJECT" in
    S905|S912)
      mkdir -p $INSTALL/usr/share/bootloader/device_trees
      cp -a $PKG_BUILD/*.dtb $INSTALL/usr/share/bootloader/device_trees
    ;;
  esac
}
