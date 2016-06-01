#!/bin/bash

set -e
set -x

if rpm -q --whatprovides kernel | grep -Fqv "$(uname -r)"; then
  rpm -q --whatprovides kernel | grep -Fv "$(uname -r)" | xargs sudo dnf -y erase
fi

sudo dnf clean all
