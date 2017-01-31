#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

# Remove the hardware ID for the ethernet device
$WRAPPER begin
$WRAPPER delete interfaces ethernet eth0 hw-id
$WRAPPER commit
$WRAPPER save
$WRAPPER end

sudo aptitude -y clean
