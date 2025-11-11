# Resource Group configurations - ACTUAL VALUES
resource_groups = {
  dev-rg = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
      owner       = "shariff"
    }
  }
}

# storage-accounts configurations - ACTUAL VALUES
storage_accounts = {
  "devstgweb001" = {
    name                     = "devstgweb001"
    resource_group_name      = "dev-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"

    static_website_enabled   = true
    index_document           = "index.html"
    error_404_document       = "404.html"
    
    tags = {
      environment = "dev"
      purpose     = "frontend"
    }
  }
  # "devstgapp001" = {
  #   name                     = "devstgapp001"
  #   resource_group_name      = "dev-app-rg"
  #   location                 = "centralindia"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  #   account_kind             = "StorageV2"
  #   static_website_enabled   = false
  #   tags = {
  #     environment = "dev"
  #     purpose     = "backend"
  #   }
  # }
}

containers = {
  "cont1" = {
    storage_account_key = "devstgweb001"
    access_type         = "private"
  }
}