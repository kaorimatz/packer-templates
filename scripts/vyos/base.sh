#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

$WRAPPER begin
$WRAPPER set system package repository squeeze components 'main contrib non-free'
$WRAPPER set system package repository squeeze distribution 'squeeze'
$WRAPPER set system package repository squeeze url 'http://mirrors.kernel.org/debian'
$WRAPPER commit
$WRAPPER save
$WRAPPER end

sudo aptitude -y update

sudo sed -i -e 's,^.*:/sbin/getty\s\+.*\s\+tty[2-6],#\0,' /etc/inittab
