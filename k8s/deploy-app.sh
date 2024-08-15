#!/bin/bash

   # Get the directory path of the script
   SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Connect to the AKS cluster
   az aks get-credentials --resource-group sock-shop-RG --name sock-shop-aks-cluster-test-env --overwrite-existing

    # Deploy the sockshop application
   kubectl apply -f "$SCRIPT_DIR/sockshop-deployment.yaml"

   echo "sleeping for 1 minute to allow sockshop to start..."
   sleep 1m


   kubectl apply -f "$SCRIPT_DIR/01-cert-manager.crds.yaml"
   helm repo add jetstack https://charts.jetstack.io
   helm repo update
   helm install cert-manager --namespace cert-manager --create-namespace --version v1.15.2 jetstack/cert-manager
#    kubectl apply -f 01-cert-manager.crds.yaml

   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update prometheus-community
   helm install prometheus prometheus-community/kube-prometheus-stack --namespace sock-shop --create-namespace
   echo "sleeping for 2 minutes to allow prometheus to start..."
   sleep 2m
   kubectl apply -f ./alert-manager/00-slack-hook-secret.yaml
   kubectl apply -f ./alert-manager/01-alertmanager-configmap.yaml
   helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --namespace sock-shop -f alert-manager/values.yaml
# or 
# echo "PWD: $(pwd) ingress1"
#     bash ../manifests/monitoring/deploy-monitoring.sh

# echo "PWD: $(pwd) ingress2"



     kubectl apply -f "$SCRIPT_DIR/00-ingress-nginx.yaml"
     echo "sleeping for 1 minute"
     sleep 1m
     kubectl apply -f "$SCRIPT_DIR/02-issuer-prod.yaml"
     echo "applying ingress-nginx controller, cert-manager and issuer ---"

    echo "sleeping for 2 minutes"
    sleep 2m

    # kubectl apply -f 03-main-ingress.yaml
    kubectl apply -f "$SCRIPT_DIR/03-main-ingress.yaml"
    
    

    
    



# ip-addr=kubectl get svc -n ingress-nginx
# echo "${ip-addr}"


kubectl get svc -n ingress-nginx