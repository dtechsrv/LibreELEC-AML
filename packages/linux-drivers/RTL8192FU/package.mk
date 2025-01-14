# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="RTL8192FU"
PKG_VERSION="78bbe0258d227174eb6e4594b42c32c357cd3cf6"
PKG_SHA256="202619830fbb4315089cca9460e4b4201cafe4ef9efcecf4905699777b4bb395"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/BrightX/rtl8192fu"
PKG_URL="https://github.com/BrightX/rtl8192fu/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8192FU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n \
       USER_EXTRA_CFLAGS="-Wno-error=date-time"
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
