#!/usr/bin/env bash

docker build -t docker.apps.blierop.com/api-gateway:latest -f src/main/docker/Dockerfile .
