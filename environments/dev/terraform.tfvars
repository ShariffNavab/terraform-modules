# Resource Group configurations - ACTUAL VALUES
resource_groups = {
  dev-rg = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
    }
  },
  qa-rg = {
    location = "southindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
    }
  },
  dev-rg = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
    }
  }
}


# storage-accounts configurations - ACTUAL VALUES
storage_accounts = {
  # "shariffciaccount" = {
  #   name                     = "shariffciaccount"
  #   resource_group_name      = "dev-rg"
  #   location                 = "centralindia"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  #   account_kind             = "StorageV2"

  #   static_website_enabled = false
  #   index_document         = "index.html"
  #   error_404_document     = "404.html"

  #   allow_nested_items_to_be_public = true
  #   min_tls_version                 = "TLS1_2"
  #   https_traffic_only_enabled      = true

  #   tags = {
  #     environment = "dev"
  #     purpose     = "frontend"
  #   }
  # }
}

# Containers Configurations - ACTUAL VALUES
containers = {
  # "shariffciaccount_cont1" = {
  #   container_name      = "cont1"
  #   storage_account_key = "shariffciaccount"
  #   access_type         = "private"
  # },
  # "shariffciaccount_cont2" = {
  #   container_name      = "cont2"
  #   storage_account_key = "shariffciaccount"
  #   access_type         = "private"
  # }
}