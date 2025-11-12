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
  "shariffciaccount" = {
    name                     = "shariffciaccount"
    resource_group_name      = "dev-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"

    static_website_enabled = false
    index_document         = "index.html"
    error_404_document     = "404.html"

    allow_nested_items_to_be_public = true
    min_tls_version                 = "TLS1_2"
    https_traffic_only_enabled      = true

    tags = {
      environment = "dev"
      purpose     = "frontend"
    }
  },
  "shariffsiaccount" = {
    name                     = "shariffsiaccount"
    resource_group_name      = "dev-rg"
    location                 = "southindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"

    static_website_enabled = false
    index_document         = "index.html"
    error_404_document     = "404.html"

    allow_nested_items_to_be_public = false
    min_tls_version                 = "TLS1_0"
    https_traffic_only_enabled      = true

    tags = {

    }
  }
}

# Containers Configurations - ACTUAL VALUES
containers = {
  "shariffciaccount_cont1" = {
    container_name      = "cont1"
    storage_account_key = "shariffciaccount"
    access_type         = "private"
  },
  "shariffciaccount_cont2" = {
    container_name      = "cont2"
    storage_account_key = "shariffciaccount"
    access_type         = "private"
  }
  "shariffsiaccount_cont1" = {
    container_name      = "cont1"
    storage_account_key = "shariffsiaccount"
    access_type         = "private"
  },
  "shariffsiaccount_cont2" = {
    container_name      = "cont2"
    storage_account_key = "shariffsiaccount"
    access_type         = "private"
  }
}