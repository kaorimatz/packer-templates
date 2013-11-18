#!/bin/bash

set -e
set -x

sudo mount ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
