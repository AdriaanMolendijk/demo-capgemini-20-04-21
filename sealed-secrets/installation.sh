# Add repository to helm repo
helm repo add bitnami-labs https://github.com/bitnami-labs/sealed-secrets

# Install helm chart
helm install <controller-name> bitnami-labs/sealed-secrets --version <version>

# Fetch public key
kubeseal --fetch-cert \
    --controller-name=<controller-name> \
    --controller-namespace=kube-system \
    > pub-cert.pem

# Demo secret
kubectl create secret generic mysecret \
    --from-literal=password=Adriaan123 \
    --dry-run=client -o yaml > secret.yaml

# Demo sealed secret
kubeseal --format yaml < secret.yaml > sealedsecret.yaml