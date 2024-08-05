resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-RG"
  location = var.location

  tags = {
    environment = var.env_name
  }
}
