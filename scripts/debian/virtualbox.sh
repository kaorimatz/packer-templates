#!/bin/bash

set -e
set -x

sudo aptitude -y install bzip2
sudo aptitude -y install dkms
sudo aptitude -y install make

# Uncomment this if you want to install Guest Additions with support for X
#sudo aptitude -y install xserver-xorg

sudo mount -o loop ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
