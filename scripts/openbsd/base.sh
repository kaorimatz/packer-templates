#!/bin/sh

set -e
set -x

sudo pkg_add curl

sudo tee /etc/rc.conf.local <<EOS
sndiod_flags=NO
sendmail_flags=NO
EOS

sed -e 's/\(ttyC[^0].*getty.*\)on /\1off/' /etc/ttys | sudo tee /etc/ttys > /dev/null
