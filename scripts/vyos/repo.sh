#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

$WRAPPER begin
# The package repository for helium has been moved to dev.packages.vyos.net/legacy/repos/vyos
$WRAPPER set system package repository community components 'main'
$WRAPPER set system package repository community distribution 'helium'
$WRAPPER set system package repository community url 'http://dev.packages.vyos.net/legacy/repos/vyos'
$WRAPPER set system package repository squeeze components 'main contrib non-free'
$WRAPPER set system package repository squeeze distribution 'squeeze'
$WRAPPER set system package repository squeeze url 'http://archive.debian.org/debian'
$WRAPPER commit
$WRAPPER save
$WRAPPER end

sudo aptitude -y update
