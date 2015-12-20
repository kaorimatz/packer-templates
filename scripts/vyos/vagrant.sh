#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

date | sudo tee /etc/vagrant_box_build_time

PUBLIC_KEY=$(curl -fsSL -A curl 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub')
KEY_TYPE=$(echo "$PUBLIC_KEY" | awk '{print $1}')
KEY=$(echo "$PUBLIC_KEY" | awk '{print $2}')
$WRAPPER begin
$WRAPPER set system login user vagrant authentication public-keys vagrant type "$KEY_TYPE"
$WRAPPER set system login user vagrant authentication public-keys vagrant key "$KEY"
$WRAPPER commit
$WRAPPER save
$WRAPPER end
