# Create htpass file
# touch .htpasswd

# Have access to the htpasswd utility. On Red Hat Enterprise Linux this is available by installing the httpd-tools package.

# Add password to .htpasswd file
# htpasswd -b .htpasswd <username> <password>

# Add oauth provider for htpasswd
oc apply -f oauth.yaml

# Create secret containing .htpasswd file
oc create secret generic htpass-secret --from-file=htpasswd=.htpasswd -n openshift-config

# Update user permissions
oc adm policy add-cluster-role-to-user cluster-admin demo-admin

# Remove kubeadmin user
# oc delete secrets kubeadmin -n kube-system

# Update passwords
#oc create secret generic htpass-secret --from-file=htpasswd=.htpasswd --dry-run=client -o yaml -n openshift-config | oc replace -f -
