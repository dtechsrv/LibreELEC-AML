# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.17.0"
PKG_ARCH="x86_64 arm aarch64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.makemkv.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

if [ "${TARGET_ARCH}" = "arm" ]; then
  PKG_URL="https://mail.makemkv.com/download/makemkv-bin-${PKG_VERSION}_armhf.tar.gz"
  PKG_SHA256="abbbadb10fc631e80ae413a58862f4d85b590d2a18b61b6409c1070b37dacda9"
else
  PKG_URL="http://www.makemkv.com/download/makemkv-bin-${PKG_VERSION}.tar.gz"
  PKG_SHA256="e277d75722aede64ac1b564969c7d64608e00591b17068dc7a88358e7a03e2c0"
fi

makeinstall_target() {
  :
}
