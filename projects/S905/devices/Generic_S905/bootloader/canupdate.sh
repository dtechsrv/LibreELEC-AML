# Allow upgrades from previous MXQ-4K-Pro_2G and *1G images
if [ "$1" = "MXQ-4K-Pro_2G.arm" ] || [ "$1" = "MXQ-4K-Pro_1G.arm" ]; then
  exit 0
# Allow upgrades from previous KI-Pro, KI-Plus and K_Series images
elif [ "$1" = "KI-Pro.arm" ] || [ "$1" = "KI-Plus.arm" ] || [ "$1" = "K_Series.arm" ]; then
  exit 0
else
  exit 1
fi
