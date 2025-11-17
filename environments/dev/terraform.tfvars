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
}


# Vnet configuration

vnet_name           = "dev-vnet"
resource_group_name = "dev-rg"
location            = "centralindia"
address_space       = ["10.0.0.0/16"]
enable_firewall     = false

# Subnets Configuration

subnets = {
  # web-subnet = {
  #   address_prefixes = ["10.0.1.0/24"]
  #   nsg_key          = "web"
  # }

  app-subnet = {
    address_prefixes = ["10.0.2.0/24"]
    nsg_key          = "app"
  }

  db-subnet = {
    address_prefixes = ["10.0.3.0/24"]
    nsg_key          = "db"
  }

  worker-subnet = {
    address_prefixes = ["10.0.4.0/24"]
    nsg_key          = null
  }
}

# NSG configuration

network_security_groups = {
  web = {
    rules = [
      {
        name                       = "allow-http"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-https"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  app = {
    rules = [
      {
        name                       = "allow-web-to-app"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "10.0.1.0/24" # web subnet
        destination_address_prefix = "*"
      }
    ]
  }

  db = {
    rules = [
      {
        name                       = "allow-app-to-db"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.0.2.0/24" # app subnet
        destination_address_prefix = "*"
      }
    ]
  }
}
