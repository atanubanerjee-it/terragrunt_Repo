output "location" {
  value = azurerm_virtual_network.this.location
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_id" {
  value = azurerm_subnet.this.id
}
