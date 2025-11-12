# Resource Group configurations - ACTUAL VALUES
resource_groups = {
  dev-rg = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
    }
  }
  qa-rg = {
    location = "centralindia"
    tags = {

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

  #   tags = {
  #     environment = "dev"
  #     purpose     = "frontend"
  #   }
  # }
}

containers = {
  # "cont1" = {
  #   storage_account_key = "shariffciaccount"
  #   access_type         = "private"
  # }
}