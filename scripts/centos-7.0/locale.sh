#!/bin/bash

set -e
set -x

localedef --list-archive | grep -a -v en_US.utf8 | xargs sudo localedef --delete-from-archive
sudo cp /usr/lib/locale/locale-archive{,.tmpl}
sudo build-locale-archive
