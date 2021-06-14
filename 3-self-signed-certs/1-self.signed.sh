#!/bin/bash
# tutorial: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development

#export CA_FILE_NAME=cgdemo_ca
#export CSR_FILE_NAME=cgdemo_csr
#export CERT_FILE_NAME=cgdemo
#export CERT_CONFIG="/C=NL/ST=Utrecht/L=Utrecht/O=Capgemini/OU=CSD/CN=blierop.com"

#### Create CA
# Create private key
openssl genrsa -des3 -out ${CA_FILE_NAME}.key 2048
# Create root certificate 
openssl req -x509 -new -nodes -key ${CA_FILE_NAME}.key -sha256 -days 1825  -out ${CA_FILE_NAME}.pem \
-subj ${CERT_CONFIG}

### Create CSR
# Create private key
openssl genrsa -out ${CSR_FILE_NAME}.key 2048
# Create CSR
openssl req -new -key ${CSR_FILE_NAME}.key -out ${CSR_FILE_NAME}.csr -subj ${CERT_CONFIG}

### Create certificate
openssl x509 -req -in ${CSR_FILE_NAME}.csr -CA ${CA_FILE_NAME}.pem -CAkey ${CA_FILE_NAME}.key -CAcreateserial \
-out ${CERT_FILE_NAME}.crt -days 365 -sha256
