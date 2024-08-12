output "kube_config" {
  description = "The Kubernetes configuration"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}
