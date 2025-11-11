resource "azurerm_storage_account" "storage" {
  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind

  # Static website hosting
  static_website {
    index_document     = each.value.static_website_enabled ? each.value.index_document : null
    error_404_document = each.value.static_website_enabled ? each.value.error_404_document : null
  }

  tags = merge(each.value.tags, {
    managed-by = "terraform"
  })
}

resource "azurerm_storage_container" "containers" {
  for_each = var.containers

  name                  = each.key
  storage_account_name  = azurerm_storage_account.storage[each.value.storage_account_key].name
  container_access_type = each.value.access_type
}