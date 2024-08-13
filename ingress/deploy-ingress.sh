#!/bin/bash

# Get the directory path of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of YAML files in the correct order
yaml_files=(
    "00-ingress-nginx.yml"
    "01-cert-manager.crds.yaml"
    "02-issuer-prod.yaml"
    "03-main-ingress.yaml"
)

# Loop through YAML files and apply them
for yaml_file in "${yaml_files[@]}"; do
    kubectl apply -f "$SCRIPT_DIR/$yaml_file"
done

ip-addr=kubectl get svc -n ingress-nginx
echo "${ip-addr}"