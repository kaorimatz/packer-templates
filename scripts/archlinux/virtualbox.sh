#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils
sudo systemctl enable vboxservice

sudo mkdir /etc/systemd/system/vboxservice.service.d/
sudo tee /etc/systemd/system/vboxservice.service.d/50-reset-condition-virtualization.conf <<EOF
[Unit]
# VirtualBox with KVM is detected as "kvm". This should be fixed in systemd 229
# by https://github.com/systemd/systemd/pull/1995.
ConditionVirtualization=
EOF
