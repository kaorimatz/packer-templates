#!/bin/sh

set -e
set -x

pkg_add sudo--
cat <<EOF > /etc/sudoers

#includedir /etc/sudoers.d
EOF
mkdir /etc/sudoers.d
cat <<EOF > /etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
vagrant ALL=(ALL) NOPASSWD: ALL
EOF
chmod 440 /etc/sudoers.d/vagrant
