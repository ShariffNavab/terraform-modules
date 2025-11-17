# resource-groups

output "resource_group_ids" {
  value = module.resource_groups.resource_group_ids
}

output "resource_group_names" {
  value = module.resource_groups.resource_group_names
}

# Storage Account Outputs
output "storage_account_ids" {
  description = "IDs of created storage accounts"
  value       = module.storage_accounts.storage_account_ids
}

output "storage_account_names" {
  description = "Names of created storage accounts"
  value       = module.storage_accounts.storage_account_names
}

output "static_website_urls" {
  description = "URLs for storage accounts with static hosting"
  value       = module.storage_accounts.static_website_urls
}

# Sensitive outputs (use carefully)
output "storage_access_keys" {
  description = "Primary access keys for storage accounts"
  value       = module.storage_accounts.primary_access_keys
  sensitive   = true
}