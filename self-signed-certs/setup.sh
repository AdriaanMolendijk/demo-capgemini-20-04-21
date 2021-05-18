k create -n openshift-config cm docker-cert --from-file=docker.apps.blierop.com=openshift.crt

oc edit image.config.openshift.io/cluster

# spec:
#   additionalTrustedCA:
#     name: docker-cert

oc create secret docker-registry docker-creds \
    --docker-server=docker.apps.blierop.com \
    --docker-username=<username>  \
    --docker-password=<password>
