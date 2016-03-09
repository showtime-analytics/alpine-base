#!/bin/bash

cd $(dirname $0)/..

if [ ! -f build_version ]; then
    echo "File \"build_version\" not found!"
    exit 1
fi

(set -x; ./scripts/test.sh alpine-base `cat build_version`)