#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils

sudo tee /etc/modules-load.d/virtualbox.conf <<EOF
vboxguest
vboxsf
vboxvideo
EOF

sudo systemctl enable vboxservice
