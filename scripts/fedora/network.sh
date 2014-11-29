#!/bin/bash

set -e
set -x

sudo tee /etc/sysconfig/network <<EOF
NOZEROCONF=yes
EOF
