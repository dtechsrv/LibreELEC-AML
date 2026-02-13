# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-2020 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="aml-vnc"
PKG_VERSION="1.3.0"
PKG_SHA256="5355d368dc5fa4c3618db57191a99bc49df1f630cd3318d1f4bf5f5e63838d15"
PKG_REV="104"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/dtechsrv/aml-vnc-server"
PKG_URL="https://github.com/dtechsrv/aml-vnc-server/archive/${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain libvncserver"
PKG_SECTION="service/system"
PKG_SHORTDESC="Amlogic VNC Server"
PKG_LONGDESC="Amlogic VNC Server is a Virtual Network Computing (VNC) server for Amlogic devices"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Amlogic VNC Server"
PKG_ADDON_TYPE="xbmc.service"

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P ${PKG_BUILD}/aml-vnc ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PL $(get_build_dir libvncserver)/.install_pkg/usr/lib/libvncserver.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
