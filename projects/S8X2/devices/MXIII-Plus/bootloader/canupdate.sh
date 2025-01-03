# Allow upgrades from previous MXIII_Plus image
if [ "$1" = "MXIII_Plus.arm" ]; then
  exit 0
else
  exit 1
fi
