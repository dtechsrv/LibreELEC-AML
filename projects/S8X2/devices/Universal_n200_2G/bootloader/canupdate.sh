# Allow upgrades from previous n200-AP6330_2G image
if [ "$1" = "n200-AP6330_2G.arm" ]; then
  exit 0
else
  exit 1
fi
