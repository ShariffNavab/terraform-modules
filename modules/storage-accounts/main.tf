resource "azurerm_storage_account" "storage" {
  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind

  tags = merge(each.value.tags, {
    managed-by = "terraform"
  })
}


resource "azurerm_storage_account_static_website" "static_website" {
  for_each = { for k, v in var.storage_accounts : k => v if v.static_website_enabled }

  storage_account_id = azurerm_storage_account.storage[each.key].id
  index_document     = each.value.index_document
  error_404_document = each.value.error_404_document
}

resource "azurerm_storage_container" "containers" {
  for_each = var.containers

  name                  = each.key
  storage_account_id    = azurerm_storage_account.storage[each.value.storage_account_key].id
  container_access_type = each.value.access_type
}