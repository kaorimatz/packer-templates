#!/bin/bash

set -e
set -x

memory_size_in_kilobytes=$(free | awk '/^Mem:/ { print $2 }')
swap_size_in_kilobytes=$((memory_size_in_kilobytes * 2))
sfdisk /dev/sda <<EOF
label: dos
size=${swap_size_in_kilobytes}KiB, type=82
                                   type=83, bootable
EOF
mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt

curl -fsS https://www.archlinux.org/mirrorlist/?country=all > /tmp/mirrolist
grep '^#Server' /tmp/mirrolist | sort -R | head -n 50 | sed 's/^#//' > /tmp/mirrolist.50
rankmirrors -v /tmp/mirrolist.50 | tee /etc/pacman.d/mirrorlist
pacstrap /mnt base grub openssh sudo

swapon /dev/sda1
genfstab -p /mnt >> /mnt/etc/fstab
swapoff /dev/sda1

arch-chroot /mnt /bin/bash
