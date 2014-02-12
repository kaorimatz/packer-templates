#!/bin/sh

set -e
set -x

sudo pkg_add curl

cat <<EOS | sudo tee /etc/rc.conf.local
sndiod_flags=NO
sendmail_flags=NO
EOS

sed -e 's/\(ttyC[^0].*getty.*\)on /\1off/' < /etc/ttys | sudo tee /etc/ttys > /dev/null
