#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils
sudo systemctl enable vboxservice
