#!/bin/bash

# Register the Microsoft.RedHatOpenShift resource provider
az provider register -n Microsoft.RedHatOpenShift --wait

# Register the Microsoft.Compute resource provider
az provider register -n Microsoft.Compute --wait

# Register the Microsoft.Storage resource provider
az provider register -n Microsoft.Storage --wait

# Register the Microsoft.Authorization resource provider
az provider register -n Microsoft.Authorization --wait