# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.17.7"
PKG_SHA256="8c5bc831bc952b1f873cc8450c64e392db0b2479b626d180f0ffc965668951d0"
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
