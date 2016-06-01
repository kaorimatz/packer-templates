#!/bin/ksh

set -e
set -x

sudo pkg_add curl

sudo tee /etc/rc.conf.local <<EOF
sndiod_flags=NO
sendmail_flags=NO
EOF

sed -e 's/\(ttyC[^0].*getty.*\)on /\1off/' /etc/ttys | sudo tee /etc/ttys > /dev/null
