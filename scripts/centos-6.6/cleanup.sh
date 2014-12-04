#!/bin/bash

set -e
set -x

sudo yum clean all
sudo yum history new
sudo truncate -c -s 0 /var/log/yum.log
