# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.18.1"
PKG_SHA256="b16576651eadec3585e817843a2a1a0ebcaa713b89dd1e020d8b1d056ddb2fd6"
PKG_ARCH="x86_64 arm aarch64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.makemkv.com/"
PKG_URL="http://www.makemkv.com/download/makemkv-bin-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}
