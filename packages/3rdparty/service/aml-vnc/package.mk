# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-2020 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="aml-vnc"
PKG_VERSION="f87a8f41aa6c6463a99ec3be9aebaff3cf31c5ee"
PKG_SHA256="dbec8fbedc956b8730414654da4f90b035c1cb67e2320e5c572b1343fb029e36"
PKG_REV="107"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kszaq/aml-vnc"
PKG_URL="https://github.com/kszaq/my-addons/archive/${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain libvncserver"
PKG_SECTION="service/system"
PKG_SHORTDESC="Amlogic VNC Server"
PKG_LONGDESC="Amlogic VNC Server is a Virtual Network Computing (VNC) server for Amlogic devices"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Amlogic VNC Server"
PKG_ADDON_TYPE="xbmc.service"

unpack() {
  mkdir -p ${PKG_BUILD}
  tar --strip-components=3 -xf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz -C ${PKG_BUILD} my-addons-${PKG_VERSION}/${PKG_NAME}/sources
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,lib}
  cp -P ${PKG_BUILD}/aml-vnc ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -PL $(get_build_dir libvncserver)/.install_pkg/usr/lib/libvncserver.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
