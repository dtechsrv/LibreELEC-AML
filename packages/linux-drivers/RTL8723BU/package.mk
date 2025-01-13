# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2025-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="RTL8723BU"
PKG_VERSION="af3a408d6399655b0db23c2c8720436ca725ca47"
PKG_SHA256="357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtl8723bu"
PKG_URL="https://github.com/lwfinger/rtl8723bu/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8723BU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
