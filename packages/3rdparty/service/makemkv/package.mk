# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv"
PKG_VERSION="1.17.7"
PKG_SHA256="762e552d46f9ec75a7c62dcb7d97c0fd9e6a15120d0ef6f5a080cee291d3a0ef"
PKG_REV="100"
PKG_ARCH="x86_64 arm aarch64"
PKG_LICENSE="OSS"
PKG_SITE="http://makemkv.com/"
PKG_URL="http://www.makemkv.com/download/makemkv-oss-${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="dtech(.hu)"
PKG_DEPENDS_TARGET="toolchain makemkv-bin openssl expat ffmpeg zlib"
PKG_SECTION="service"
PKG_SHORTDESC="MakeMKV"
PKG_LONGDESC="MakeMKV allows you to decode encrypted discs so they can be played on the fly or archived in MKV format"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="MakeMKV"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--disable-gui"

case "${TARGET_ARCH}" in
  x86_64)
    BIN_ARCH="amd64"
    ;;
  arm)
    BIN_ARCH="armhf"
    ;;
  aarch64)
    BIN_ARCH="arm64"
    ;;
esac

pre_configure_target() {
  cd ..
  rm -rf .${TARGET_NAME}
}

makeinstall_target() {
  :
}

addon() {
  # Install makemkv binary
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  install -m 0755 $(get_build_dir makemkv-bin)/bin/${BIN_ARCH}/makemkvcon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/makemkvcon

  # Copy additional binaries
  cp ${PKG_BUILD}/out/mmccextr ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp ${PKG_BUILD}/out/mmgplsrv ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  # Copy licence file
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/license
  cp $(get_build_dir makemkv-bin)/src/eula_en_linux.txt ${ADDON_BUILD}/${PKG_ADDON_ID}/license

  # Install libs
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp ${PKG_BUILD}/out/libmakemkv.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp ${PKG_BUILD}/out/libdriveio.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp ${PKG_BUILD}/out/libmmbd.so.? ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
