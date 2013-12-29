#!/bin/bash

set -e
set -x

sudo yum -y install bzip2
sudo yum -y install dkms
sudo yum -y install xorg-x11-server-Xorg

sudo mount -o loop ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
