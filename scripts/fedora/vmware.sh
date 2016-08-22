#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo dnf -y install open-vm-tools
sudo mkdir -p /mnt/hgfs
