 #!/bin/bash

# Set up environment variables
#export LOCATION=westeurope
#export RESOURCEGROUP=myrg-0615
#export CLUSTER=mycluster-0615
#export DOMAIN=openshift.blierop.com

# Create the cluster
az aro create \
  --resource-group $RESOURCEGROUP \
  --name $CLUSTER \
  --vnet aro-vnet \
  --master-subnet master-subnet \
  --worker-subnet worker-subnet \
  --domain $DOMAIN \
  --pull-secret @pull-secret.txt

# After creating the cluster, you need to add the following DNS A records to your domain:
# api - pointing to the api server IP address
# .apps - pointing to the ingress IP address
#
# You can use the following command to retreive these IP adresses
az aro show -n mycluster-0615 -g myrg-0615 --query '{api:apiserverProfile.ip, ingress:ingressProfiles[0].ip}'

# List credentials cluster
az aro list-credentials \
  --name $CLUSTER \
  --resource-group $RESOURCEGROUP
