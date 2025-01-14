# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="RTL8821CU"
PKG_VERSION="178fcbf4f1bf5b94580b5708016d0b2c2ded1720"
PKG_SHA256="29d3e053dd1fad37ee03de65e4ed2b25a4fb9aaf8bb6bd435da477753d03ad26"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/dtechsrv/rtl8821CU"
PKG_URL="https://github.com/dtechsrv/rtl8821CU/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Realtek RTL8821CU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
