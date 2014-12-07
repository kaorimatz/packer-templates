#!/bin/bash

set -e
set -x

sudo sed -i -e 's,^.*:/sbin/getty\s\+.*\s\+tty[2-6],#\0,' /etc/inittab
