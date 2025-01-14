#!/bin/sh

# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-2023 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023-present Gabor Dee (dee.gabor@gmail.com)

if [ -e /storage/.kodi/addons/repository.libreelec.tv ]; then
  echo "Removing outdated LibreELEC Add-ons update..."
  rm -rf /storage/.kodi/addons/repository.libreelec.tv
fi

if [ -e /storage/.kodi/addons/service.libreelec.settings ]; then
  echo "Removing outdated LibreELEC Configuration update..."
  rm -rf /storage/.kodi/addons/service.libreelec.settings
fi
