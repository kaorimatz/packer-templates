#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo ln -s /dev/null /etc/udev/rules.d/65-vyatta-net.rules

sudo apt-get -y install make
sudo apt-get -y install gcc
sudo apt-get -y install linux-vyatta-kbuild

sudo ln -s /usr/src/linux-image/debian/build/build-amd64-none-amd64-vyos "/lib/modules/$(uname -r)/build"

sudo mkdir /mnt/vmware
sudo mount -o loop,ro ~/linux.iso /mnt/vmware

mkdir /tmp/vmware
tar zxf /mnt/vmware/VMwareTools-*.tar.gz -C /tmp/vmware
sudo /tmp/vmware/vmware-tools-distrib/vmware-install.pl --default --force-install
rm -r /tmp/vmware

sudo umount /mnt/vmware
sudo rm -r /mnt/vmware
rm -f ~/linux.iso
