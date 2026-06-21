# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-2021 Frank Hartung (supervisedthinking (@) gmail.com)
# Copyright (C) 2022-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.18.4"
PKG_SHA256="cee56de0baa5531abed16bd862742d308d772b4ab4dae16ee865bf74f04a1608"
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
