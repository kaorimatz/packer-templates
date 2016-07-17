#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

# Installing VMWare Tools causes a crash on shutdown, so use open-vm-tools
# instead.
# https://communities.vmware.com/message/2169889
# https://www.illumos.org/issues/3326
sudo pkg install open-vm-tools
