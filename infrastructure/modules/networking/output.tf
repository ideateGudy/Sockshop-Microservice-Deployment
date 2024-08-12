output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.network_sg.id
}

# output "subnet1_id" {
#   description = "The ID of subnet1"
#   value       = azurerm_virtual_network.virtual_network.subnet[0].id
# }

# output "subnet2_id" {
#   description = "The ID of subnet2"
#   value       = azurerm_virtual_network.virtual_network.subnet[1].id
# }

