#!/bin/bash  
set -e 

mkdir -p ./.vscode

if [ -e ./.vscode/registry.beagle.default.key ]; then
  echo "registry.beagle.default.key is ready!"
else
  /usr/bin/openssl genrsa -out ./.vscode/registry.beagle.default.key 2048
  echo "registry.beagle.default.key is ready!"
fi

if [ -e ./.vscode/registry.beagle.default.crt ]; then
  echo "registry.beagle.default.crt is ready!"
else
  /usr/bin/openssl req -new -key ./.vscode/registry.beagle.default.key -out ./.vscode/registry.beagle.default.csr -subj "/CN=registry/C=CN/ST=BeiJing/L=Beijing/O=beaglecloud/OU=System" -config ./.beagle/registry.beagle.default.cnf
  /usr/bin/openssl x509 -req -in ./.vscode/registry.beagle.default.csr -CA ./.vscode/ca.crt -CAkey ./.vscode/ca.key -CAcreateserial -out ./.vscode/registry.beagle.default.crt -days 3650 -extensions v3_req -extfile ./.beagle/registry.beagle.default.cnf
  echo "registry.beagle.default.crt is ready!"
fi