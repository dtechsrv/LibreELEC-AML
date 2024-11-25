# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="avl6862-aml"
PKG_VERSION="7f02154e0835784fc07dc19312ed69b0b1a260f2"
PKG_SHA256="9fc7f1fa1c53825926a2bb676d9c290a4ff986c4cb80f66136bc9474ad11a0f4"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/dtechsrv/avl6862-aml"
PKG_URL="https://github.com/dtechsrv/avl6862-aml/archive/${PKG_VERSION}.tar.gz"
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
