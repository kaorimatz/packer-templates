#!/bin/bash

set -e
set -x

sudo yum --enablerepo=epel clean all
sudo tee /var/log/yum.log < /dev/null
