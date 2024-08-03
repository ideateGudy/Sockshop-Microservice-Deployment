

resource "random_pet" "prefix" {}


resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-RG"
  location = "East US 2"

  tags = {
    environment = var.env_name
  }
}



resource "azurerm_network_security_group" "network_sg" {
  name                = "${var.name_prefix}-NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.name_prefix}-VN"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.network_sg.id
  }

  tags = {
    environment = var.env_name
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
   name       = "${var.name_prefix}-${var.cluster_name}-${var.env_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.name_prefix}-k8s"
  kubernetes_version  = "1.30.2"

  default_node_pool {
    name            = "${var.node_default_name}"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = var.env_name
  }
}
