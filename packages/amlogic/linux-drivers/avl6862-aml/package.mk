# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2021 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="avl6862-aml"
PKG_VERSION="690f930d580d09a5c6d8e5288a69f520e6a2ac9d"
PKG_SHA256="78dae7eb253f36978f9e2d3be37923e6bd64ddddfebcfb63c6b997e51b6e36e3"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/dtechsrv/dvb_tv-aml"
PKG_URL="https://github.com/dtechsrv/dvb_tv-aml/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Availink AVL6862 internal DVB tuner driver for Amlogic devices developed by afl1"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  kernel_make -C "$(kernel_path)" M="${PKG_BUILD}"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    find ${PKG_BUILD}/ -name \*.ko -not -path '*/\.*' -exec cp {} ${INSTALL}/$(get_full_module_dir)/${PKG_NAME} \;
}

post_install() {
  enable_service amlogic-dvb.service
}
