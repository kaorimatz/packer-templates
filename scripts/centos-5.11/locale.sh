#!/bin/bash

set -e
set -x

sudo find /usr/lib/locale -mindepth 1 -maxdepth 1 -type d -not -name en_US.utf8 -exec rm -r {} +
sudo /usr/sbin/build-locale-archive
sudo rm -r /usr/lib/locale/en_US.utf8
