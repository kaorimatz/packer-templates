#!/bin/bash

set -e
set -x

sudo yum clean all
cat /dev/null | sudo tee /var/log/yum.log
