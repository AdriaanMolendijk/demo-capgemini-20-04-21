#!/usr/bin/env bash

docker build -t docker.apps.openshift-1.blierop.com/api-gateway:latest -f src/main/docker/Dockerfile .
