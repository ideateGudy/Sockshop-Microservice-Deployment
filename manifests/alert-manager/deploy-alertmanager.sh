#!/bin/bash

# Get the directory path of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of YAML files in the correct order
yaml_files=(
    "00-slack-hook-secret.yaml"
    "01-alertmanager-configmap.yaml"
    "02-alertmanager-dep.yaml"
    "03-alertmanager-svc.yaml"
)

# Loop through YAML files and apply them
for yaml_file in "${yaml_files[@]}"; do
    kubectl apply -f "$SCRIPT_DIR/$yaml_file"
done

