# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="xonard"
PKG_VERSION="4d68bae9de8e2275447031fbd719d16267656327"
PKG_SHA256="f3772d1e71c622a6fd5e828329e08d50aa7e447c8ed05b0988752db36fc8eb7a"
PKG_LICENSE="GPL3"
PKG_SITE="https://github.com/alexp-sssup/asus-xonar-u1-utils"
PKG_URL="https://github.com/alexp-sssup/asus-xonar-u1-utils/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Xonard: A simple daemon to handle the non-standard audio controls on Asus Xonar U1 device"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

make_target() {
  ${CC} -Wall -o xonard xonard.c
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/xonard ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/lib/xonard
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/lib/xonard
}

post_install() {
  enable_service xonard.service
}
