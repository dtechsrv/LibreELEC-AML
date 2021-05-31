# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

. $(get_pkg_directory libxkbcommon)/package.mk

PKG_NAME="chrome-libxkbcommon"
PKG_LONGDESC="libxkbcommon for chrome"
PKG_URL=""
PKG_DEPENDS_UNPACK+=" libxkbcommon"
# linking failed with meson
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-docs \
                           --disable-wayland \
                           --disable-static \
                           --enable-shared"

unpack() {
  mkdir -p $PKG_BUILD
  tar --strip-components=1 -xf $SOURCES/${PKG_NAME:7}/${PKG_NAME:7}-$PKG_VERSION.tar.xz -C $PKG_BUILD
}

makeinstall_target() {
  :
}
