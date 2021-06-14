#!/usr/bin/env bash

docker build -t docker.apps.openshift-1.blierop.com/backend-service -f src/main/docker/Dockerfile .
