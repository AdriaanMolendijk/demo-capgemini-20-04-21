# tutorial: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development

#### Create CA
# Create private key
openssl genrsa -des3 -out myCA.key 2048
# Create root certificate 
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

### Create CSR
# Create private key
openssl genrsa -out example.com.key 2048
# Create CSR
openssl req -new -key example.com.key -out example.com.csr

### Create certificate
openssl x509 -req -in example.com.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial \
-out example.com.crt -days 825 -sha256 -extfile example.com.ext
