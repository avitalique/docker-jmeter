#!/bin/sh

CONTAINER_NAME="jmeter"

# Export vars from a file
export $(grep -v '^#' vars.env | xargs)

# Run docker
docker stop ${CONTAINER_NAME} > /dev/null 2>&1
docker rm ${CONTAINER_NAME} > /dev/null 2>&1
docker run --name ${CONTAINER_NAME} -it -v ${PWD}:/jmeter ${IMAGE_NAME}:${IMAGE_VERSION} $@