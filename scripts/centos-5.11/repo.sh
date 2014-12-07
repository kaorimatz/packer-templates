#!/bin/bash

set -e
set -x

curl -L -O https://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-5
sudo rpm --import RPM-GPG-KEY-EPEL-5
rm RPM-GPG-KEY-EPEL-5

curl -L -O https://download.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
sudo yum -y install epel-release-5-4.noarch.rpm
rm epel-release-5-4.noarch.rpm
sudo sed -i -e 's/^enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo
