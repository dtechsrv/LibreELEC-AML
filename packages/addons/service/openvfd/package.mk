# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018 Arthur Liberman (arthur_liberman (at) hotmail.com)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="openvfd"
PKG_VERSION="ab063c7edee33439ed6dc108dc970648cbfdbb0e"
PKG_SHA256="33fd03684604c67663d05a29ca8dad25760a8b49bb1bed1d9420392cbbd309a7"
PKG_REV="100"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL3"
PKG_SITE="https://github.com/arthur-liberman/service.openvfd"
PKG_URL="https://github.com/arthur-liberman/service.openvfd/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="OpenVFD Service for controlling VFD displays"
PKG_LONGDESC="The OpenVFD service addon (${PKG_VERSION:0:7}) allows you to control Ethernet and WiFi status, Time, Date and Playback indicators on a VFD display via the Linux OpenVFD driver"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="OpenVFD"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_PROJECTS="Allwinner Rockchip S905 S912"
PKG_MAINTAINER="Arthur Liberman"

post_unpack() {
  rm $PKG_BUILD/addon.xml
  rm $PKG_BUILD/changelog.txt
  rm $PKG_BUILD/icon.png
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
    cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID

    cp $PKG_DIR/addon.xml $ADDON_BUILD/$PKG_ADDON_ID
    sed -e "s|@ADDON_VERSION@|$ADDON_VERSION|g" -i $ADDON_BUILD/$PKG_ADDON_ID/addon.xml
    sed -e "s|@PKG_MAINTAINER@|$PKG_MAINTAINER|g" -i $ADDON_BUILD/$PKG_ADDON_ID/addon.xml
    sed -e "s|@PKG_SITE@|$PKG_SITE|g" -i $ADDON_BUILD/$PKG_ADDON_ID/addon.xml
}
