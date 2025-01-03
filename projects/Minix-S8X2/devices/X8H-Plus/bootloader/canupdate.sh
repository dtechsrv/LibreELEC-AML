# Allow upgrades from previous X8-H_Plus image
if [ "$1" = "X8-H_Plus.arm" ]; then
  exit 0
else
  exit 1
fi
