# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-2024 Team CoreELEC (https://coreelec.org)
# Copyright (C) 2025-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="entware"
PKG_VERSION=""
PKG_ARCH="x86_64 arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Entware/Entware"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_LONGDESC="Entware: A software repository that offers various software programs that can be installed on your device"
PKG_TOOLCHAIN="manual"

case "${TARGET_ARCH}" in
  x86_64)
    ENTWARE_ARCH="x64-k3.2"
    ;;
  arm)
    if [ "${TARGET_KERNEL_ARCH}" = "arm64" ]; then
      ENTWARE_ARCH="aarch64-k3.10"
    else
      ENTWARE_ARCH="armv7sf-k3.2"
    fi
    ;;
  aarch64)
    ENTWARE_ARCH="aarch64-k3.10"
    ;;
esac

post_install() {
  mkdir -p ${INSTALL}/usr/sbin
  cp -P ${PKG_DIR}/scripts/installentware ${INSTALL}/usr/sbin

  # Replace distro name
  sed -e "s/@DISTRONAME@/${DISTRONAME}/g" \
      -i ${INSTALL}/usr/sbin/installentware

  # Replace target architecture
  sed -e "s/@ENTWARE_ARCH@/${ENTWARE_ARCH}/g" \
      -i ${INSTALL}/usr/sbin/installentware

  enable_service entware.service
}
