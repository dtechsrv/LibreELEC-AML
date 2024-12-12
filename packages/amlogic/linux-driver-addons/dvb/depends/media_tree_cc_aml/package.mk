# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2018 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-2023 Team CoreELEC (https://coreelec.org)
# Copyright (C) 2024-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="media_tree_cc_aml"
PKG_VERSION="2019-07-10"
PKG_SHA256="a5e80cb3c01bbb21dfd11e8d6d677461a93f655721dc6804b950a60db1d38ada"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build/downloads/"
PKG_URL="https://github.com/dtechsrv/${PKG_NAME}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain media_tree_aml"
PKG_NEED_UNPACK="${LINUX_DEPENDS} $(get_pkg_directory media_tree_aml)"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"

post_unpack() {
  # hack/workaround for borked upstream kernel/media_build
  # without removing atomisp there a lot additional includes that
  # slowdown build process after modpost from 3min to 6min
  # even if atomisp is disabled via kernel.conf
  rm -rf ${PKG_BUILD}/drivers/staging/media/atomisp
  sed -i 's|^.*drivers/staging/media/atomisp.*$||' \
    ${PKG_BUILD}/drivers/staging/media/Kconfig
}

configure() {
  rm -rf ${PKG_BUILD}/drivers/media/platform/meson/dvb
  cp -Lr $(get_build_dir media_tree_aml)/* ${PKG_BUILD}/
  echo 'source "drivers/media/platform/meson/dvb/Kconfig"' >>  "${PKG_BUILD}/drivers/media/platform/Kconfig"
  echo 'source "drivers/media/platform/meson/video_dev/Kconfig"' >>  "${PKG_BUILD}/drivers/media/platform/Kconfig"
}
