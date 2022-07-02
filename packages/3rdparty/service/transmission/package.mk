# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="transmission"
PKG_VERSION="bb6b5a062ee594dfd4b7a12a6b6e860c43849bfd" #v3.0.0
PKG_REV="102"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission.git"
PKG_MAINTAINER="SupervisedThinking"
PKG_DEPENDS_TARGET="toolchain zlib openssl curl libevent"
PKG_SECTION="service/downloadmanager"
PKG_SHORTDESC="Transmission is a fast, easy and free BitTorrent client"
PKG_LONGDESC="Transmission is an open source, volunteer-based project. Unlike some BitTorrent clients, Transmission doesn't play games with its users to make money. Transmission doesn't bundle toolbars, pop-up ads, flash ads, twitter tools, or anything else. It doesn't hold some features back for a payware version. Its source code is available for anyone to review. We don't track our users, and our website and forums have no third-party ads or analytics. Transmission is designed for easy, powerful use. We've set the defaults to Just Work and it only takes a few clicks to configure advanced features like watch directories, bad peer blocklists, and the web interface. When Ubuntu chose Transmission as its default BitTorrent client, one of the most-cited reasons was its easy learning curve. In separate benchmarks, Linux Format and Lacrocivious both found Transmission to use less CPU than any other GUI client. It even used less CPU than some non-GUI clients. Transmission also has the lowest memory footprint of any major BitTorrent client. Imageshack chose Transmission for its BitTorrent farms because the competition requires amounts of memory several times greater than Transmission. Unlike many cross-platform applications, Transmission integrates seamlessly with your operating system. It's fast, it's extremely lightweight, and — even though it's available for a variety of platforms. Transmission has the features you want from a BitTorrent client: encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and NAT-PMP port forwarding, webseed support, watch directories, tracker editing, global and per-torrent speed limits, and more."
GET_HANDLER_SUPPORT="git"

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
