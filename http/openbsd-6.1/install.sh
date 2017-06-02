#!/bin/sh

set -e
set -x

# Always use the first line of ftplist.cgi for the default answer of "HTTP Server?".
# This is a workaround for the change introduced in the following commit:
# https://github.com/openbsd/src/commit/bf983825822b119e4047eb99486f18c58351f347
sed -i'' 's/\[\[ -z $_l \]\] && //' /install.sub

/install -a -f /install.conf && chroot /mnt
