#!/bin/bash

set -e
set -x

dd if=/dev/zero of=EMPTY bs=1M || :
rm EMPTY
