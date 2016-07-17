#!/bin/sh

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo pkg install -y perl5
sudo pkg install -y compat6x-amd64

sudo mkdir /mnt/vmware
sudo mdconfig -a -t vnode -f ~/freebsd.iso -u 0
sudo mount -t cd9660 /dev/md0 /mnt/vmware

mkdir /tmp/vmware
tar zxf /mnt/vmware/vmware-freebsd-tools.tar.gz -C /tmp/vmware
find /tmp/vmware/vmware-tools-distrib -type f -name '*.pl' \
  -exec sed -i '' -e 's,#!/usr/bin/perl,#!/usr/local/bin/perl,' {} +
sudo /tmp/vmware/vmware-tools-distrib/vmware-install.pl --default
rm -r /tmp/vmware

sudo umount /mnt/vmware
sudo rm -r /mnt/vmware
rm -f ~/freebsd.iso
