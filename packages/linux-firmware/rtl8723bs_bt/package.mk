# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2023 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2024-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="rtl8723bs_bt"
PKG_VERSION="09eb91f"
PKG_SHA256="4bb8483c4a14a9e0dfc4a6ddca18486caab5f361be2441b91e9e2a399ca9f33e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtl8723bs_bt"
PKG_URL="https://github.com/lwfinger/rtl8723bs_bt/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="rtl8723bs_bt Linux firmware"

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_firmware_dir)/rtl_bt
  cp -PR ${PKG_DIR}/firmware/rtl_bt/*.bin ${INSTALL}/$(get_full_firmware_dir)/rtl_bt

  mkdir -p ${INSTALL}/usr/bin
  cp -P ${PKG_BUILD}/rtk_hciattach ${INSTALL}/usr/bin
}
