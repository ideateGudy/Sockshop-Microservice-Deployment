resource "azurerm_network_security_group" "network_sg" {
  name                = "${var.name_prefix}-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.name_prefix}-VN"
  location            = var.location
  resource_group_name = var.resource_group_name
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
