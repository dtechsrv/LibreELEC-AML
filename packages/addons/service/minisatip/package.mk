# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="minisatip"
PKG_VERSION="1.2.83"
PKG_SHA256="303d1e4e56d80ecbbfd5f08c4857dce9dc7133b7f8cfbdfc40a10fd4edc55879"
PKG_REV="102"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/catalinii/minisatip"
PKG_URL="https://github.com/catalinii/minisatip/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdvbcsa libxml2 openssl"
PKG_SECTION="service"
PKG_SHORTDESC="minisatip: a Sat>IP streaming server for Linux"
PKG_LONGDESC="minisatip(${PKG_VERSION_NUMBER}): is a Sat>IP streaming server for Linux supporting DVB-C, DVB-S/S2, DVB-T/T2, ATSC and ISDB-T"
PKG_BUILD_FLAGS="-sysroot"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Minisatip"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-netcv \
                           --enable-dvbca \
                           --enable-dvbaes \
                           --enable-dvbcsa \
                           --with-xml2=$(get_build_dir libxml2)"

pre_configure_target() {
  cd ${PKG_BUILD}
    rm -rf .${TARGET_NAME}
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${PKG_BUILD}/minisatip ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/webif
    cp -PR ${PKG_BUILD}/html/* ${ADDON_BUILD}/${PKG_ADDON_ID}/webif
}
