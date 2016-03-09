#!/bin/bash

if [ -z ${DOCKER_REGISTRY+x} ]; then
    echo "Environment variable \"DOCKER_REGISTRY\" does not exist!"
    exit 1
fi

if [ -z ${IMAGE_NAME+x} ]; then
    echo "Environment variable \"IMAGE_NAME\" does not exist!"
    exit 1
fi

if [ -z ${GO_PIPELINE_COUNTER+x} ]; then
    echo "Environment variable \"GO_PIPELINE_COUNTER\" does not exist!"
    exit 1
fi

cd $(dirname $0)/..

VERSION=`cat version`-${GO_PIPELINE_COUNTER}

(set -x; ./scripts/package.sh $DOCKER_REGISTRY $IMAGE_NAME $VERSION)

echo "${DOCKER_REGISTRY}/${IMAGE_NAME}" > repository

echo "${VERSION}" > build_version
