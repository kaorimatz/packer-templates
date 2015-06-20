#!/bin/bash

set -e
set -x

memory_size=$(free -m | awk '/^Mem:/ { print $2 }')
swap_size=$((memory_size * 2))

parted --script /dev/sda unit MB
parted --script /dev/sda mktable msdos
parted --align=cylinder --script /dev/sda mkpart primary 0 $swap_size
parted --align=cylinder --script /dev/sda mkpart primary $swap_size 100%
mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap /mnt base openssh sudo syslinux

swapon /dev/sda1
genfstab -p /mnt >> /mnt/etc/fstab
swapoff /dev/sda1

arch-chroot /mnt /bin/bash
