# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="media_tree_aml"
PKG_VERSION="f9a4b158183866c589ee8c06ab740f41aa08fa66"
PKG_SHA256="ff629f20b39749e6523571409c74c38a27ba0101b0ffe2a1ecea3e4dafea6dd2"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/CoreELEC"
PKG_URL="https://github.com/dtechsrv/media_tree_aml/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Source of Linux Kernel amlogic drivers to build with media_build."
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}/
  tar -xf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz -C ${PKG_BUILD}/../
}
