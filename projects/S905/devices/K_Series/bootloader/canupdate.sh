# Allow upgrades from previous KI-Pro and KI-Plus images
if [ "$1" = "KI-Pro.arm" ] || [ "$1" = "KI-Plus.arm" ]; then
  exit 0
else
  exit 1
fi
