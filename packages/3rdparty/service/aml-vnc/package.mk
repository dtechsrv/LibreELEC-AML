# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-2020 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="aml-vnc"
PKG_VERSION="1.2.0"
PKG_SHA256="38009d0ea84868c7e077eb7594f2808bf5acdae3b7e691cb73fb800e9489d064"
PKG_REV="113"
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
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,lib}
  cp -P ${PKG_BUILD}/aml-vnc ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -PL $(get_build_dir libvncserver)/.install_pkg/usr/lib/libvncserver.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
