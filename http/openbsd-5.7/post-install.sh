#!/bin/sh

cat <<EOF > /mnt/etc/sudoers

#includedir /etc/sudoers.d
EOF
mkdir /mnt/etc/sudoers.d
cat <<EOF > /mnt/etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
vagrant ALL=(ALL) NOPASSWD: ALL
EOF
chmod 440 /mnt/etc/sudoers.d/vagrant
