#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo apt-get -y install open-vm-tools
sudo mkdir -p /mnt/hgfs
