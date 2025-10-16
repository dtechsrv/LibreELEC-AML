# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.18.2"
PKG_SHA256="bfc4c7cebc0f00497671ffd56e6a34f0770a9e6af7eff2f0127efa143f28636e"
PKG_ARCH="x86_64 arm aarch64"
PKG_LICENSE="OSS"
PKG_SITE="https://www.makemkv.com/"
PKG_URL="https://www.makemkv.com/download/makemkv-bin-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}
