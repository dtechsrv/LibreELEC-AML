# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="repository.yt.backport_unofficial"
PKG_VERSION="1.0"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.dtech.hu/packages/yt.backport_unofficial/Leia/"
PKG_URL=""
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="YouTube unofficial backport repository for Python2"
PKG_LONGDESC="This repository is an unofficial collection of official YouTube add-ons that are compatible with Kodi v18.x (Leia)."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="YouTube Backport Add-on Repository"
PKG_ADDON_TYPE="xbmc.addon.repository"

make_target() {
  sed -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
      -e "s|@PKG_SITE@|$PKG_SITE|g" \
      -i addon.xml
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -R $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
