# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2025-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="apcupsd"
PKG_VERSION="3.14.14"
PKG_SHA256="37a266d5dc3240227ff2f8d02fdf608a48d82f90665931ea315558b96f23b1ec"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://www.apcupsd.org/"
PKG_URL="http://archive.raspbian.org/raspbian/pool/main/a/apcupsd/apcupsd_$PKG_VERSION.orig.tar.gz"
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_SECTION="service"
PKG_SHORTDESC="APC UPS Daemon"
PKG_LONGDESC="Apcupsd is a program for monitoring UPSes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="APC UPS Daemon"
PKG_ADDON_TYPE="xbmc.service"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--with-distname=unknown \
                             --disable-snmp \
                             --disable-test \
                             --disable-modbus-usb \
                             --disable-modbus \
                             --without-x"

  # fails to build in subdirs
  cd ${PKG_BUILD}
  rm -rf ".${TARGET_NAME}"
}

makeinstall_target() {
  :
}

addon() {
  # binaries
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp ${PKG_BUILD}/src/apcupsd ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp ${PKG_BUILD}/src/apctest ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp ${PKG_BUILD}/src/apcaccess ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  # config
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/config
  cp ${PKG_DIR}/apcupsd.conf ${ADDON_BUILD}/${PKG_ADDON_ID}/config
}
