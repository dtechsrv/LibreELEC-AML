# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="opengl-meson-t82x"
PKG_VERSION="3.2-r16p0-00rel0"
PKG_SHA256="814512d1256c8a4784a033e8d58abbfee8e379b8badc8ed24f1266ad501697ab"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/dtechsrv/opengl-meson-t82x"
PKG_URL="https://github.com/dtechsrv/opengl-meson-t82x/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libhybris"
PKG_LONGDESC="OpenGL ES pre-compiled libraries for Mali GPUs. The libraries were extracted from Khadas VIM2 Android firmware."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/system
    cp -a system/* ${INSTALL}/system
}

post_install() {
  enable_service unbind-console.service
}
