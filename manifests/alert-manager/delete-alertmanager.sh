#!/bin/bash

# Get the directory path of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of YAML files in the correct order
yaml_files=(
    "03-alertmanager-svc.yaml"
    "02-alertmanager-dep.yaml"
    "01-alertmanager-configmap.yaml"
    "00-slack-hook-secret.yaml"
)

# Loop through YAML files and apply them
for yaml_file in "${yaml_files[@]}"; do
    kubectl delete -f "$SCRIPT_DIR/$yaml_file"
done

