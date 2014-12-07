#!/bin/bash

set -e
set -x

sudo sed -i -e 's,^ACTIVE_CONSOLES=.*$,ACTIVE_CONSOLES=/dev/tty1,' /etc/sysconfig/init
