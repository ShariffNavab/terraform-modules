output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.subnets :
    k => v.id
  }
}

output "nsg_ids" {
  value = {
    for k, v in azurerm_network_security_group.nsg :
    k => v.id
  }
}

output "firewall_public_ip" {
  value = try(azurerm_public_ip.firewall_ip[0].ip_address, null)
}
