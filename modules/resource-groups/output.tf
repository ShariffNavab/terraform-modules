output "resource_group_ids" {
  description = "Map of resource group names to their IDs"
  value = {
    for rg_name, rg in azurerm_resource_group.rgs :
    rg_name => rg.id
  }
}

output "resource_group_names" {
  description = "Map of resource group names to their Azure names"
  value = {
    for rg_name, rg in azurerm_resource_group.rgs :
    rg_name => rg.name
  }
}