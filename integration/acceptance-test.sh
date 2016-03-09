#!/bin/bash

cd $(dirname $0)/..

if [ ! -f repository ]; then
    echo "File \"repository\" not found!"
    exit 1
fi

if [ ! -f build_version ]; then
    echo "File \"build_version\" not found!"
    exit 1
fi

./scripts/test.sh `cat repository` `cat build_version`