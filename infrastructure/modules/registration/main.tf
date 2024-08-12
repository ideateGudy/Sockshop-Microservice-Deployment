
resource "null_resource" "register_provider" {
  count = var.execute_on_create ? 1 : 0

  provisioner "local-exec" {
    command = "az provider register --namespace Microsoft.TimeSeriesInsights"
  }

  # Trigger this null_resource only when the resource group changes
  triggers = {
    always_run = "${timestamp()}"
  }
}


# output file path >>>> --file ${path.module}/tmp/kubeconfig

resource "null_resource" "get_kubeconfig_credentials" {
  count = var.execute_on_create ? 1 : 0

  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.cluster_name}"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}





#Apply kubernetes manifest file
# resource "null_resource" "registration" {
#   depends_on = [null_resource.get_kubeconfig_credentials]


#  provisioner "local-exec" {
#     command = "kubectl apply -f ./manifests/sockshop.yml && kubectl apply -f ./manifests/ingress.yml"
#  }
# }

#Install Ingress Controller using helm
# resource "null_resource" "install_ingress_controller" {
#   depends_on = [null_resource.registration]

#       # helm install ingress-nginx ingress-nginx/ingress-nginx --set controller.service.loadBalancerIP=${azurerm_public_ip.ingress.ip_address}
#   provisioner "local-exec" {
#     command = <<EOT
#       helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#       helm repo add https://helm.nginx.com/stable
#       helm repo update
#       kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.1/deploy/static/provider/cloud/deploy.yaml 

#     EOT
#     interpreter = ["bash", "-c"]
#   }
# }
