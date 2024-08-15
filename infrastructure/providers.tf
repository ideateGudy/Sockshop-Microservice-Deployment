
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name   = "terraform-sock-rg"
  #   storage_account_name  = "terraformstorageacc"
  #   container_name        = "tfstate"
  #   key                   = "terraform.tfstate"
  # }

  required_version = ">= 0.14"
}



provider "azurerm" {
  features {}
}

# provider "random" {
  
  
# }
