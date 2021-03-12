 #!/bin/bash

# Set up environment variables
LOCATION=westeurope
RESOURCEGROUP=myrg-03-12
CLUSTER=mycluster-03-12

# Create the cluster
az aro create \
  --resource-group $RESOURCEGROUP \
  --name $CLUSTER \
  --vnet aro-vnet \
  --master-subnet master-subnet \
  --worker-subnet worker-subnet \
  --domain adriaanmolendijk.info \
  --pull-secret @pull-secret.txt

# List credentials cluster
az aro list-credentials \
  --name $CLUSTER \
  --resource-group $RESOURCEGROUP