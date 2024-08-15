resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-RG"
  location = var.location

  tags = {
    environment = var.env_name
  }
}


# resource "azurerm_resource_group" "terraform-backend-rg" {
#   name     = "terraform-sock-rg"
#   location = var.location

#   tags = {
#     environment = var.env_name
#   }
  
# }

# resource "azurerm_storage_account" "terraform_backend" {
#   name                     = "terraformstorageacc"
#   resource_group_name      = azurerm_resource_group.terraform-backend-rg.name
#   location                 = azurerm_resource_group.terraform-backend-rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
  
#   tags = {
#     environment = var.env_name
#   }
# }