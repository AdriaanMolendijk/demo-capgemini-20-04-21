#!/bin/bash

#export SUBSCRIPTION_ID = b6ed5ab0-58e7-4539-bb0e-6d29b1b4defc
# Install az cli (locally)
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli


# If you have multiple Azure subscriptions, specify the relevant subscription ID:
# az account set --subscription $SUBSCRIPTION_ID

# Register the Microsoft.RedHatOpenShift resource provider
az provider register -n Microsoft.RedHatOpenShift --wait

# Register the Microsoft.Compute resource provider
az provider register -n Microsoft.Compute --wait

# Register the Microsoft.Storage resource provider
az provider register -n Microsoft.Storage --wait

# Register the Microsoft.Authorization resource provider
az provider register -n Microsoft.Authorization --wait