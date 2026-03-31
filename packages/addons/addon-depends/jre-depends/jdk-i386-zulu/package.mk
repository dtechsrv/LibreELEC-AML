# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Peter Vicman (peter.vicman@gmail.com)

PKG_NAME="jdk-i386-zulu"
PKG_VERSION="8.38.0.13-8.0.212"
PKG_SHA256="46510895f56f6a0ac2ab4912620f1af79a7ae72cad6b13037c2cdead8d91b5c2"
PKG_LICENSE="GPLv2"
PKG_SITE="https://www.azul.com/products/zulu-enterprise/"
PKG_URL="https://cdn.azul.com/zulu/bin/zulu${PKG_VERSION%%-*}-ca-jdk${PKG_VERSION##*-}-linux_i686.tar.gz"
PKG_LONGDESC="Zulu, the open Java(TM) platform from Azul Systems."
PKG_TOOLCHAIN="manual"

post_unpack() {
  rm -f $PKG_BUILD/src.zip
}
