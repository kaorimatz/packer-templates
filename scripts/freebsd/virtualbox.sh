#!/bin/sh

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

sudo pkg install -y virtualbox-ose-additions-nox11

sudo tee -a /etc/rc.conf <<EOF
vboxguest_enable="YES"
vboxservice_enable="YES"
EOF
