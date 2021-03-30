k create -n openshift-config cm docker-cert --from-file=docker.apps.adriaanmolendijk.info=openshift.crt

oc edit image.config.openshift.io/cluster
# spec:
#   additionalTrustedCA:
#     name: docker-cert