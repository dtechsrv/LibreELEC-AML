# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libevent"
PKG_VERSION="2.1.12"
PKG_SHA256="7180a979aaa7000e1264da484f712d403fcf7679b1e9212c4e3d09f5c93efc24"
PKG_LICENSE="BSD-3-Clause"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/libevent/archive/release-${PKG_VERSION}-stable.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_LONGDESC="Event notification library."

PKG_CMAKE_OPTS_TARGET="-DEVENT__DISABLE_DEBUG_MODE=on \
                       -DEVENT__DISABLE_BENCHMARK=on \
                       -DEVENT__DISABLE_TESTS=on \
                       -DEVENT__LIBRARY_TYPE=SHARED \
                       -DEVENT__DISABLE_SAMPLES=on"
