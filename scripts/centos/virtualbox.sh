#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

sudo yum -y install bzip2
sudo yum -y --enablerepo=epel install dkms
sudo yum -y install kernel-devel
sudo yum -y install make
sudo yum -y install perl

# Uncomment this if you want to install Guest Additions with support for X
#sudo yum -y install xorg-x11-server-Xorg

# In CentOS 6 or earlier, dkms package provides SysV init script called
# dkms_autoinstaller that is enabled by default
if systemctl list-unit-files | grep -q dkms.service; then
  sudo systemctl start dkms
  sudo systemctl enable dkms
fi

sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
