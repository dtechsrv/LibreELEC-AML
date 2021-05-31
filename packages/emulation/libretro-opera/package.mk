# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-opera"
PKG_VERSION="539dc447b536ba52eb3485f11d9bf1c06e30cf75"
PKG_SHA256="5552025528d8e9100b2f6729ab511f7708f36a687d2d07c379a0087ae7b81021"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/opera-libretro"
PKG_URL="https://github.com/libretro/opera-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.opera: Port of 4DO/libfreedo for Kodi."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="opera_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="OPERA_LIB"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
