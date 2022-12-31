# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="device-tree-copy"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_LONGDESC="Copy all compiled and static device tree binary files."
PKG_TOOLCHAIN="manual"

make_target() {
  # Enter kernel directory and get compiled device trees
  pushd ${BUILD}/linux-$(kernel_version) > /dev/null
  cp arch/${TARGET_KERNEL_ARCH}/boot/dts/amlogic/*.dtb ${PKG_BUILD}
  popd > /dev/null
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/bootloader/device_trees

  # Copy static (pre-compiled) device trees
  if find_dir_path "bootloader/device_trees"; then
    cp -n ${FOUND_PATH}/*.dtb ${INSTALL}/usr/share/bootloader/device_trees
  else
    # Copy compiled device trees
    cp -a ${PKG_BUILD}/*.dtb ${INSTALL}/usr/share/bootloader/device_trees
  fi
}
