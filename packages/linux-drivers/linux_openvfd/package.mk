# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018 Arthur Liberman (arthur_liberman (at) hotmail.com)
# Copyright (C) 2018-2023 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="linux_openvfd"
PKG_VERSION="d753dd21ae9345b310111c5de43de3db4927c871"
PKG_SHA256="ef3a0077aa5a83093d48980d998d6abf0f07cb16c95879ee7c5d80de0b40b588"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL3"
PKG_SITE="https://github.com/arthur-liberman/linux_openvfd"
PKG_URL="https://github.com/arthur-liberman/linux_openvfd/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux vfd-configurations"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Linux OpenVFD is an open source Linux driver for VFD displays"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make ARCH=${TARGET_KERNEL_ARCH} \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       -C "$(kernel_path)" M="${PKG_BUILD}/driver"
  make OpenVFDService
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    find ${PKG_BUILD}/ -name \*.ko -not -path '*/\.*' -exec cp {} ${INSTALL}/$(get_full_module_dir)/${PKG_NAME} \;

  mkdir -p ${INSTALL}/usr/bin
    cp -P ${PKG_DIR}/scripts/openvfd-config ${INSTALL}/usr/bin
    cp -P ${PKG_DIR}/scripts/openvfd ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/sbin
    cp -P OpenVFDService ${INSTALL}/usr/sbin
}

post_install() {
  enable_service openvfd-config.service
  enable_service openvfd.service
}
