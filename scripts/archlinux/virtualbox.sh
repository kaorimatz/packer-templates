#!/bin/sh

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils

sudo tee /etc/modules-load.d/virtualbox.conf <<EOS
vboxguest
vboxsf
vboxvideo
EOS

sudo systemctl enable vboxservice
