#!/bin/ksh

set -e
set -x

for dir in $(mount | awk '{ print $3 }'); do
  sudo dd if=/dev/zero of="$dir/EMPTY" bs=1M || :
  sudo rm "$dir/EMPTY"
done

swap_device=$(swapctl -l | awk '!/^Device/ { print $1 }')
sudo swapctl -d "$swap_device"
sudo dd if=/dev/zero of="$swap_device" bs=1M || :
