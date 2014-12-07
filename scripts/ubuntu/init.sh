#!/bin/bash

set -e
set -x

sudo sed -i -e 's,^\(ACTIVE_CONSOLES="/dev/tty\).*,\11",' /etc/default/console-setup
for f in /etc/init/tty[^1]*.conf; do
  sudo mv "$f"{,.bak}
done
