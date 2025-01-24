# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="misc-packages"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain ${ADDITIONAL_PACKAGES}"
PKG_SECTION="virtual"
PKG_LONGDESC="misc-packages: Metapackage for miscellaneous packages"

if [ "${XONARD_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" xonard"
fi
