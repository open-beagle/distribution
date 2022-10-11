#!/bin/bash  
set -e 

mkdir -p ./.vscode

if ! [ -e ./.vscode/registry.beagle.default.key ]; then
  /usr/bin/openssl genrsa \
                  -out ./.vscode/registry.beagle.default.key 2048

  /usr/bin/openssl req -new \
                  -key ./.vscode/registry.beagle.default.key \
                  -out ./.vscode/registry.beagle.default.csr \
                  -subj "/CN=registry/C=CN/ST=BeiJing/L=Beijing/O=beaglecloud/OU=System" \
                  -config ./.beagle/registry.beagle.default.cnf
                  
  /usr/bin/openssl x509 -req \
                  -in ./.vscode/registry.beagle.default.csr \
                  -CA ./.vscode/ca.crt \
                  -CAkey ./.vscode/ca.key \
                  -CAcreateserial -out ./.vscode/registry.beagle.default.crt \
                  -days 3650 -extensions v3_req \
                  -extfile ./.beagle/registry.beagle.default.cnf
fi

if ! [ -e ./.vscode/registry.beagle.default.crt ]; then
  /usr/bin/openssl req -new \
                  -key ./.vscode/registry.beagle.default.key \
                  -out ./.vscode/registry.beagle.default.csr \
                  -subj "/CN=registry/C=CN/ST=BeiJing/L=Beijing/O=beaglecloud/OU=System" \
                  -config ./.beagle/registry.beagle.default.cnf
                  
  /usr/bin/openssl x509 -req \
                  -in ./.vscode/registry.beagle.default.csr \
                  -CA ./.vscode/ca.crt \
                  -CAkey ./.vscode/ca.key \
                  -CAcreateserial -out ./.vscode/registry.beagle.default.crt \
                  -days 3650 -extensions v3_req \
                  -extfile ./.beagle/registry.beagle.default.cnf
fi