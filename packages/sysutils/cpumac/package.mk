# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cpumac"
PKG_VERSION="1.0"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SECTION="system"
PKG_LONGDESC="cpumac: systemd service creating a persistent MAC from the CPU serial"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/cpumac-config $INSTALL/usr/bin
}

post_install() {
  enable_service cpumac-config.service
  enable_service cpumac@eth0.service
}