# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

PKG_NAME="xonard"
PKG_VERSION="4d68bae9de8e2275447031fbd719d16267656327"
PKG_SHA256="f3772d1e71c622a6fd5e828329e08d50aa7e447c8ed05b0988752db36fc8eb7a"
PKG_VERSION_NUMBER="1.0"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPL3"
PKG_URL="https://github.com/alexp-sssup/asus-xonar-u1-utils/archive/$PKG_VERSION.tar.gz"
PKG_MAINTAINER="dtech(.hu)"
PKG_SECTION="service"
PKG_SHORTDESC="Xonard: A simple daemon to handle the non-standard audio controls on Asus Xonar U1 devices"
PKG_LONGDESC="Asus Xonar U1 are pretty nice USB audio devices with a decent audio quality and a knob to control the volume and mute status of the device. The audio device itself is completely supported by linux using the snd-usb-audio kernel module. The control interface identifies itself as a standard HID devices, unfortunately this seems to be not actually true. Xonard will configure the device to properly deliver interrupts when the knob is used using the hidraw kernel interface and deliver the events to the system using the uinput kernel interface. As an added bonus the blue LED blinking is set to something reasonable."
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ASUS Xonar U1 Controls"
PKG_ADDON_TYPE="xbmc.service"

make_target() {
  ${CC} -Wall -o xonard xonard.c
  ${CC} -Wall -o xonarctl xonarctl.c
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $PKG_BUILD/xonard $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $PKG_BUILD/xonarctl $ADDON_BUILD/$PKG_ADDON_ID/bin
}
