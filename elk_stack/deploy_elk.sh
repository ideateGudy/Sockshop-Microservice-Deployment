#!/bin/bash

# Get the directory path of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



# Array of YAML files in the correct order
yaml_files=(
    "namespace.yaml"
    "elasticsearch-deployment.yaml"
    "elasticsearch-service.yaml"
    "filebeat-service-account.yaml"
    "filebeat-cluster-role.yaml"
    "filebeat-cluster-role-binding.yaml"
    "filebeat-configmap.yaml"
    "filebeat-deployment.yaml"
    "kibana-deployment.yaml"
    "kibana-service.yaml"
    "logstash-configmap.yaml"
    "logstash-deployment.yaml"
    "logstash-service.yaml"
    "ingress.yaml"
)


# Loop through YAML files and apply them
for yaml_file in "${yaml_files[@]}"; do
    kubectl apply -f "$SCRIPT_DIR/$yaml_file"
done