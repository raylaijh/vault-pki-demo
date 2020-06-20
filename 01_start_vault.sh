#!/bin/sh
set -o xtrace

# Start docker

#stop and remove vault containers if already running


podman stop vault-demo-vault
podman rm vault-demo-vault
#start Vault in dev mode on port 8200
location=$(pwd)
podman run --name vault-demo-vault -v ${location}/log:/var/log \
    -p 8200:8200 vault:1.4.0 \
    server -dev -dev-root-token-id="root" &
