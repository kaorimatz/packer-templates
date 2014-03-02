#!/bin/bash

set -e
set -x

sudo yum clean all
sudo tee /var/log/yum.log < /dev/null
