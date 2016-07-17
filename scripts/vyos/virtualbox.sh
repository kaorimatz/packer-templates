#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

sudo aptitude -y install build-essential
sudo aptitude -y install bzip2
sudo aptitude -y install dkms
sudo aptitude -y install linux-vyatta-kbuild

# Uncomment this if you want to install Guest Additions with support for X
#sudo aptitude -y install xserver-xorg

sudo ln -s /usr/src/linux-image/debian/build/build-amd64-none-amd64-vyos "/lib/modules/$(uname -r)/build"

sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
yes | sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
