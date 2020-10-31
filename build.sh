#!/bin/sh

# Export vars from a file
export $(grep -v '^#' vars.env | xargs)

# Build docker image
docker build -t "${IMAGE_NAME}:${IMAGE_VERSION}" --build-arg JMETER_VERSION=${JMETER_VERSION} .