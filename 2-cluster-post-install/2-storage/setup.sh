#!/bin/bash

oc create secret generic $STORAGE_SECRET_NAME \
 --from-literal=azurestorageaccountname=$STORAGE_ACCOUNT \
 --from-literal=azurestorageaccountkey=$STORAGE_ACCOUNT_KEY