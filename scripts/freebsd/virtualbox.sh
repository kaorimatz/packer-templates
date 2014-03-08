#!/bin/sh

set -e
set -x

sudo pkg install -y "virtualbox-ose-additions-$(cat ~/.vbox_version)"
sudo tee -a /etc/rc.conf <<EOF
vboxguest_enable="YES"
vboxservice_enable="YES"
EOF
