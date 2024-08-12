output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group_module.name
}

output "kubernetes_cluster_name" {
  value = module.aks_module.cluster_name
}


resource "local_file" "kubeconfig" {
  depends_on = [module.aks_module]
  filename   = "${path.module}/tmp/kubeconfig"
  content    = module.aks_module.kube_config
}
