#!/bin/sh

set -e
set -x

sudo tee -a /etc/rc.conf <<EOF
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"
EOF

sed -e 's/\(ttyv[^0].*getty.*\)on /\1off/' /etc/ttys | sudo tee /etc/ttys > /dev/null
