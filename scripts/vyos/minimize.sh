#!/bin/sh

set -e
set -x

sudo dd if=/dev/zero of=/EMPTY bs=1M || :
sudo rm /EMPTY
