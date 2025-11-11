# resource-groups

output "resource_group_ids" {
  value = module.resource_groups.resource_group_ids
}

output "resource_group_names" {
  value = module.resource_groups.resource_group_names
}