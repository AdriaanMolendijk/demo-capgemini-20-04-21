# cluster-installation
This folder contains code we used to do the Openshift installation on Azure. The code comes from the following source: https://docs.microsoft.com/en-us/azure/openshift/tutorial-create-cluster.
To run the setup.sh script you will need a RedHat pull secret that you can retrieve from: https://cloud.redhat.com/openshift/install/azure/aro-provisioned

The order at which the scripts are supposed to be run is the following:
1) register.sh
2) setup.sh
3) installation.sh