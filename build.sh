#!/usr/bin/env bash

# Prerequisite
# Make sure you have login hub.docker.com with acount newsnowio
# docker login -u newsnowio

set -ex

IMAGE="newsnowio/pg_dump"

# Only for mac user
# brew install gnu-sed
SED="gsed"

for version in 9.3 9.4 9.5 9.6 10
do
  ${SED} -i "/FROM postgres:*/c\FROM postgres:$version" Dockerfile
  docker build --no-cache -t ${IMAGE}:${version} .
  docker push ${IMAGE}:${version}
done
