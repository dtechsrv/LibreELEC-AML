# Allow upgrades from previous k200-AP6330_2G image
if [ "$1" = "k200-AP6330_2G.arm" ]; then
  exit 0
else
  exit 1
fi
