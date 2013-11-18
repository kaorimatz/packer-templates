#!/bin/bash

set -e
set -x

mkdir -p ~/.ssh
curl -o ~/.ssh/authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
