#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

date | sudo tee /etc/vagrant_box_build_time

public_key=$(curl -sL 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub')
type=$(echo "$public_key" | awk '{ print $1 }')
key=$(echo "$public_key" | awk '{ print $2 }')
$WRAPPER begin
$WRAPPER set system login user vagrant authentication public-keys vagrant type "$type"
$WRAPPER set system login user vagrant authentication public-keys vagrant key "$key"
$WRAPPER commit
$WRAPPER save
$WRAPPER end
