# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="RTL8723AS-aml"
PKG_VERSION="d60a8f0a7ccba32edd26148ab4531b8bb9771e3f" # v4.1.11_12622.20141215_BTCOEX20140409_ver3.5
PKG_SHA256="a69a652ff7f34ac0cc1f0d53730a90b4b43e549b78dd3c8a40b8666380d11491"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/khadas/android_hardware_wifi_realtek_drivers_8723au"
PKG_URL="https://github.com/dtechsrv/android_hardware_wifi_realtek_drivers_8723as/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Realtek RTL8723AS Linux driver"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

post_unpack() {
  sed -i 's/-DCONFIG_CONCURRENT_MODE//g; s/^CONFIG_POWER_SAVING.*$/CONFIG_POWER_SAVING = n/g; s/^CONFIG_RTW_DEBUG.*/CONFIG_RTW_DEBUG = n/g' ${PKG_BUILD}/*/Makefile
  sed -i 's/^#define CONFIG_DEBUG.*//g' ${PKG_BUILD}/*/include/autoconf.h
  sed -i 's/#define DEFAULT_RANDOM_MACADDR.*1/#define DEFAULT_RANDOM_MACADDR 0/g' ${PKG_BUILD}/*/core/rtw_ieee80211.c
}

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make -C $(kernel_path) M=${PKG_BUILD}/rtl8723AS \
    ARCH=${TARGET_KERNEL_ARCH} \
    KSRC=$(kernel_path) \
    CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
    USER_EXTRA_CFLAGS="-fgnu89-inline"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    find ${PKG_BUILD}/ -name \*.ko -not -path '*/\.*' -exec cp {} ${INSTALL}/$(get_full_module_dir)/${PKG_NAME} \;
}
