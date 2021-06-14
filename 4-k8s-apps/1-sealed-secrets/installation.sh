# Add repository to helm repo
helm repo add bitnami-labs https://bitnami-labs.github.io/sealed-secrets

helm repo update

# Install helm chart
helm install sealed-secrets-controller bitnami-labs/sealed-secrets -n kube-system

# Demo secret
kubectl create secret generic mysecret \
    --from-literal=password=Adriaan123 \
    --dry-run=client -o yaml > secret.yaml

# Demo sealed secret
kubeseal --format yaml < secret.yaml > sealedsecret.yaml
# pods "sealed-secrets-5c6c8564d9-" is forbidden: unable to validate against any security context constraint: [provider restricted: .spec.securityContext.fsGroup: Invalid value: []int64{65534}: 65534 is not an allowed group spec.containers[0].securityContext.runAsUser: Invalid value: 1001: must be in the ranges: [1000610000, 1000619999]]

# Fetch public key
#kubeseal --fetch-cert \
#    --controller-name=sealed-secrets \
#    --controller-namespace=kube-system \
#    > pub-cert.pem
