# Allow upgrades from previous MXQ-4K-Pro_2G image
if [ "$1" = "MXQ-4K-Pro_2G.arm" ] || [ "$1" = "MXQ-4K-Pro_1G.arm" ]; then
  exit 0
else
  exit 1
fi
