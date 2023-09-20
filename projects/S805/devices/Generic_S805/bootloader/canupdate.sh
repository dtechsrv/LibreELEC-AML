# Allow upgrades from previous HD18Q and m201d images
if [ "$1" = "HD18Q.arm" ] || [ "$1" = "m201d.arm" ]; then
  exit 0
else
  exit 1
fi
