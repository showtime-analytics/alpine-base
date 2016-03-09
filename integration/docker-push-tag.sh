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

if [ ! -f version ]; then
    echo "File \"version\" not found!"
    exit 1
fi

REPOSITORY=`cat repository`
BUILD_TAG=`cat build_version`
RELEASE_TAG=`cat version`

set -x

# Push build version
docker push ${REPOSITORY}/${BUILD_TAG}

# Push release version
docker tag -f ${REPOSITORY}/${BUILD_TAG} ${REPOSITORY}/${RELEASE_TAG}
docker push ${REPOSITORY}/${RELEASE_TAG}

# Clean images
docker rmi ${REPOSITORY}/${BUILD_TAG}
docker rmi ${REPOSITORY}/${RELEASE_TAG}