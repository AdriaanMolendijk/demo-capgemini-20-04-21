# Create htpass file
touch .htpasswd

# Add password to .htpasswd file
htpasswd -B .htpasswd <username> <password>

# Create secret containing .htpasswd file
oc create secret generic htpass-secret --from-file=htpasswd=.htpasswd -n openshift-config

# Remove kubeadmin user
oc delete secrets kubeadmin -n kube-system

# Update passwords
oc create secret generic htpass-secret --from-file=htpasswd=.htpasswd --dry-run=client -o yaml -n openshift-config | oc replace -f -