# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.18.3"
PKG_SHA256="c1ee720ae91b276a7c89be861146c5b934631831e8d6c8f453406435724e92bd"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://www.makemkv.com/"
PKG_URL="https://www.makemkv.com/download/makemkv-bin-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}
