#!/bin/bash

#export CERT_FILE_NAME=cgdemo
#export DOCKER_SERVER=docker.apps.openshift.blierop.com
#export DOCKER_USERNAME=cgdemo
#export DOCKER_PASSWORD=cgdemo

oc create -n openshift-config cm docker-cert --from-file=${DOCKER_SERVER}=${CERT_FILE_NAME}.crt

# oc edit image.config.openshift.io/cluster
oc patch image.config.openshift.io/cluster --patch '{"spec": {"additionalTrustedCA": {"name": "docker-cert"}}}' --type=merge
# spec:
#   additionalTrustedCA:
#     name: docker-cert
# kubectl patch deployment patch-demo --patch '{"spec": {"template": {"spec": {"containers": [{"name": "patch-demo-ctr-2","image": "redis"}]}}}}'
oc create secret docker-registry docker-creds \
    --docker-server=${DOCKER_SERVER} \
    --docker-username=${DOCKER_USERNAME}  \
    --docker-password=${DOCKER_PASSWORD}
