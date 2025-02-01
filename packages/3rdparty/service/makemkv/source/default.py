# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2025-present Gabor Dee (dee.gabor@gmail.com)

import subprocess
import xbmc
import xbmcaddon

class Monitor(xbmc.Monitor):
   def __init__(self, *args, **kwargs):
      xbmc.Monitor.__init__(self)
      self.id = xbmcaddon.Addon().getAddonInfo('id')

   def onSettingsChanged(self):
      subprocess.call(['systemctl', 'restart', self.id])

if __name__ == "__main__":
   Monitor().waitForAbort()
