resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name_prefix}-${var.cluster_name}-${var.env_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.name_prefix}-k8s"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.node_default_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  # service_principal {
  #   client_id     = var.app_id
  #   client_secret = var.password
  # }

  role_based_access_control_enabled = true

  tags = {
    environment = var.env_name
  }
}
