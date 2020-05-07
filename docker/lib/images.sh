#!/usr/bin/env bash

export NODE_HOST=registry.hub.docker.com
export NODE_ACCOUNT=chekote
export NODE_REPO=node
export NODE_TAG=9.0.0
export NODE_IMAGE=${NODE_HOST}/${NODE_ACCOUNT}/${NODE_REPO}:${NODE_TAG}
