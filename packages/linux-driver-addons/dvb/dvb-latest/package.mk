# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-2020 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="dvb-latest"
PKG_VERSION="0f25e6fb13b6bc345218800ad9ac863deb2ee9c8"
PKG_SHA256="71294995cff2bc556bcf9aa7ade595a4ccd91a1972b73d1e537d99d2ce86dbed"
PKG_LICENSE="GPL"
PKG_SITE="http://git.linuxtv.org/media_build.git"
PKG_URL="https://git.linuxtv.org/media_build.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree"
PKG_NEED_UNPACK="$LINUX_DEPENDS $(get_pkg_directory media_tree)"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB drivers from the latest kernel (media_build)"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers from the latest kernel"
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
  cp -RP $(get_build_dir media_tree)/* ${PKG_BUILD}/linux

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

  if [ ${LINUX} = "amlogic-3.10" -o ${LINUX} = "amlogic-3.14" ]; then

    # add enabled packages from static config
    grep -v "#" "${PKG_DIR}/config/usb.config" >> ${PKG_BUILD}/v4l/.config

    # hack to workaround media_build bug
    sed -e 's/CONFIG_VIDEO_S5C73M3=m/# CONFIG_VIDEO_S5C73M3 is not set/g' -i ${PKG_BUILD}/v4l/.config
    sed -e 's/CONFIG_VIDEO_TVP5150=m/# CONFIG_VIDEO_TVP5150 is not set/g' -i ${PKG_BUILD}/v4l/.config
    sed -e 's/CONFIG_DVB_AF9013=m/# CONFIG_DVB_AF9013 is not set/g' -i ${PKG_BUILD}/v4l/.config

    if [ ${LINUX} = "amlogic-3.10" ]; then
      sed -e 's/CONFIG_V4L_AMLOGIC_VIDEO2=m/# CONFIG_V4L_AMLOGIC_VIDEO2 is not set/g' -i ${PKG_BUILD}/v4l/.config
      sed -e 's/CONFIG_VIDEO_AU0828=m/# CONFIG_VIDEO_AU0828 is not set/g' -i ${PKG_BUILD}/v4l/.config
      sed -e 's/CONFIG_IR_NUVOTON=m/# CONFIG_IR_NUVOTON is not set/g' -i ${PKG_BUILD}/v4l/.config
      sed -e 's/CONFIG_DVB_USB_TBS5520SE=m/# CONFIG_DVB_USB_TBS5520SE is not set/g' -i ${PKG_BUILD}/v4l/.config
    fi
  fi

  kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}
