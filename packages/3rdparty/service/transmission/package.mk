# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="transmission"
PKG_VERSION="3.00"
PKG_SHA256="9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2"
PKG_REV="100"
PKG_LICENSE="OSS"
PKG_SITE="https://transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission-releases/raw/master/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain zlib openssl curl libevent"
PKG_SECTION="service"
PKG_SHORTDESC="Transmission BitTorrent Client"
PKG_LONGDESC="Transmission is a fast, easy and free BitTorrent client"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_DISCLAIMER="Please note that Transmission does not condone the illegal sharing of copyrighted files! Keep it legal and carry on!"

PKG_CMAKE_OPTS_TARGET="-DENABLE_DAEMON=ON \
                       -DENABLE_GTK=OFF \
                       -DENABLE_QT=OFF \
                       -DENABLE_UTILS=OFF \
                       -DENABLE_CLI=OFF \
                       -DENABLE_TESTS=OFF \
                       -DENABLE_LIGHTWEIGHT=OFF \
                       -DENABLE_UTP=ON \
                       -DENABLE_NLS=OFF \
                       -DINSTALL_DOC=OFF \
                       -DINSTALL_LIB=OFF"

addon() {
  # Create directories
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/web

  # Install binaries
  cp ${PKG_BUILD}/.${TARGET_NAME}/daemon/transmission-daemon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  # Install libs
  cp -PL $(get_build_dir libevent)/.${TARGET_NAME}/lib/libevent-?.?.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib

  # Install web
  cp -R ${PKG_BUILD}/web/* ${ADDON_BUILD}/${PKG_ADDON_ID}/web

  # Clean up
  find ${ADDON_BUILD}/${PKG_ADDON_ID}/web -name "Makefile*" -exec rm -rf {} ";"
  safe_remove ${ADDON_BUILD}/${PKG_ADDON_ID}/web/LICENSE
}
