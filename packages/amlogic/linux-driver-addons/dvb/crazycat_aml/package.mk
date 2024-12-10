# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-2018 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-2023 Team CoreELEC (https://coreelec.org)
# Copyright (C) 2024-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="crazycat_aml"
PKG_VERSION="835dc72da3ee63df7f4057bd0507887454c005d1"
PKG_SHA256="3d68d368a9eda15688c6686caa854a045a753740ec93553d80a4bcfc14c2950a"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build"
PKG_URL="https://bitbucket.org/CrazyCat/media_build/get/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree_cc_aml"
PKG_NEED_UNPACK="${LINUX_DEPENDS} $(get_pkg_directory media_tree_cc_aml)"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB driver for TBS cards with CrazyCats additions"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers for TBS"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

case "${LINUX}" in
  amlogic-3.10)
    PKG_PATCH_DIRS+="amlogic-3.10"
    ;;
  amlogic-3.14)
    PKG_PATCH_DIRS+="amlogic-3.14"
    PKG_DEPENDS_TARGET="${PKG_DEPENDS_TARGET} media_tree_aml"
    PKG_NEED_UNPACK="${PKG_NEED_UNPACK} $(get_pkg_directory media_tree_aml)"
    ;;
esac

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  cp -RP $(get_build_dir media_tree_cc_aml)/* ${PKG_BUILD}/linux
  rm -rf ${PKG_BUILD}/linux/drivers/media/platform/meson/wetek
  rm -rf ${PKG_BUILD}/linux/drivers/media/platform/meson/dvb-avl

  # Prepare drivers for amlogic-3.10 kernel
  if [ ${LINUX} = "amlogic-3.10" ]; then
    rm  -rf ${PKG_BUILD}/linux/drivers/media/platform/meson/video_dev

    # Copy amlvideodri module
    mkdir -p ${PKG_BUILD}/linux/drivers/media/amlogic/
    cp -a "$(kernel_path)/drivers/amlogic/video_dev" "${PKG_BUILD}/linux/drivers/media/amlogic"
    sed -i 's,common/,,g; s,"trace/,",g' `find ${PKG_BUILD}/linux/drivers/media/amlogic/video_dev/ -type f`

    # Copy videobuf-res module
    cp -a "$(kernel_path)/drivers/media/v4l2-core/videobuf-res.c" "${PKG_BUILD}/linux/drivers/media/v4l2-core/"
    cp -a "$(kernel_path)/include/media/videobuf-res.h" "${PKG_BUILD}/linux/include/media/"
  fi

  # Prepare drivers for amlogic-3.14 kernel
  if [ ${LINUX} = "amlogic-3.14" ]; then
    cp -Lr $(get_build_dir media_tree_aml)/* ${PKG_BUILD}/linux

    # compile modules
    echo "obj-y += video_dev/" >> "${PKG_BUILD}/linux/drivers/media/platform/meson/Makefile"
    echo "obj-y += dvb/" >> "${PKG_BUILD}/linux/drivers/media/platform/meson/Makefile"
    echo 'source "drivers/media/platform/meson/dvb/Kconfig"' >>  "${PKG_BUILD}/linux/drivers/media/platform/Kconfig"
    sed -e 's/ && RC_CORE//g' -i ${PKG_BUILD}/linux/drivers/media/usb/dvb-usb/Kconfig
  fi

  # make config all
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) allyesconfig

  # enable AML drivers
  echo "CONFIG_V4L_AMLOGIC_VIDEO=m" >> ${PKG_BUILD}/v4l/.config
  echo "CONFIG_VIDEOBUF_RESOURCE=m" >> ${PKG_BUILD}/v4l/.config

  # hack to workaround media_build bug
  sed -e 's/CONFIG_VIDEO_S5C73M3=m/# CONFIG_VIDEO_S5C73M3 is not set/g' -i ${PKG_BUILD}/v4l/.config
  sed -e 's/CONFIG_VIDEO_SAA7146_VV=m/# CONFIG_VIDEO_SAA7146_VV is not set/g' -i ${PKG_BUILD}/v4l/.config
  sed -e 's/CONFIG_VIDEO_S5K5BAF=m/# CONFIG_VIDEO_S5K5BAF is not set/g' -i ${PKG_BUILD}/v4l/.config
  sed -e 's/CONFIG_VIDEO_TVP514X=m/# CONFIG_VIDEO_TVP514X is not set/g' -i ${PKG_BUILD}/v4l/.config
  sed -e 's/CONFIG_VIDEO_TVP7002=m/# CONFIG_VIDEO_TVP7002 is not set/g' -i ${PKG_BUILD}/v4l/.config

  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}
