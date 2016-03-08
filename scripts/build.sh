#!/bin/bash

cd $(dirname $0)/..

PROJECT_NAME=$(basename `pwd`)

if [ -z ${DOCKER_REGISTRY+x} ]; then
    REPOSITORY=${PROJECT_NAME}
else
    REPOSITORY="${DOCKER_REGISTRY}/${PROJECT_NAME}"
fi

docker build --no-cache=true --tag="${REPOSITORY}:`cat version`" .