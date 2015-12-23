#!/bin/sh

set -e
set -x

sudo dd if=/dev/zero of=/EMPTY bs=1M || :
sudo rm /EMPTY

swap_device=`swapctl -l | awk '!/^Device/ { print $1 }'`
sudo swapctl -d "$swap_device"
sudo dd if=/dev/zero of="$swap_device" bs=1M || :
