#!/bin/bash

if [ -z ${GO_PIPELINE_COUNTER+x} ]; then
    echo "Environment variable \"GO_PIPELINE_COUNTER\" does not exist!"
    exit 1
fi

cd $(dirname $0)/..

VERSION=`cat version`-${GO_PIPELINE_COUNTER}

(set -x; ./scripts/package.sh "" "" $VERSION)

echo "${VERSION}" > build_version
