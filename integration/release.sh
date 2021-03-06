#!/bin/bash

cd $(dirname $0)/..

if [ -z ${DOCKER_REGISTRY+x} ]; then
    echo "Environment variable \"DOCKER_REGISTRY\" does not exist!"
    exit 1
fi

if [ ! -f build_version ]; then
    echo "File \"build_version\" not found!"
    exit 1
fi

if [ ! -f version ]; then
    echo "File \"version\" not found!"
    exit 1
fi

(set -x; ./scripts/git-push-tag.sh `cat build_version`)

(set -x; ./scripts/docker-push-tag.sh ${DOCKER_REGISTRY} `cat build_version` `cat version`)