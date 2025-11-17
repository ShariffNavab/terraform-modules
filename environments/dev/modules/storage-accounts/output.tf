output "storage_account_ids" {
  description = "Map of storage account names to their IDs"
  value       = { for k, v in azurerm_storage_account.storage : k => v.id }
}

output "storage_account_names" {
  description = "Map of storage account names"
  value       = { for k, v in azurerm_storage_account.storage : k => v.name }
}

output "static_website_urls" {
  description = "Map of static website URLs"
  value       = { for k, v in azurerm_storage_account.storage : k => v.primary_web_endpoint if can(v.primary_web_endpoint) }
}

# Optional - only if you need programmatic access
output "primary_access_keys" {
  description = "Map of storage account primary access keys"
  value       = { for k, v in azurerm_storage_account.storage : k => v.primary_access_key }
  sensitive   = true
}