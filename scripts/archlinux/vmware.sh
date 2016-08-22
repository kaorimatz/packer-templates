#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo pacman -S --noconfirm open-vm-tools
sudo systemctl enable vmtoolsd
sudo mkdir -p /mnt/hgfs
