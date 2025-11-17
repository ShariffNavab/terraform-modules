# Define the variable structure - but NO default values here either
variable "resource_groups" {
  description = "Map of resource groups to create in dev environment"
  type = map(object({
    location = string
    tags     = map(string)
  }))
}

# Storage Accounts Variables
variable "storage_accounts" {
  description = "Storage account configurations"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string

    static_website_enabled = optional(bool, false)
    index_document         = optional(string, "index.html")
    error_404_document     = optional(string, "404.html")

    allow_nested_items_to_be_public = optional(bool, true)
    min_tls_version                 = optional(string, "TLS1_2")
    https_traffic_only_enabled      = optional(bool, true)

    tags = map(string)
  }))
  default = {}
}


variable "containers" {
  description = "Container configurations with unique keys"
  type = map(object({
    container_name      = string
    storage_account_key = string
    access_type         = string
  }))
  default = {}
}


# Networking 

variable "vnet_name" {
  type        = string
  description = "VNet name for dev"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "address_space" {
  type        = list(string)
  description = "CIDR block for the VNet"
}

variable "network_security_groups" {
  description = "Independent NSGs and their rules"
  type = map(object({
    rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), [])
  }))
  default = {}
}

variable "subnets" {
  description = "Subnets with optional NSG assignment"
  type = map(object({
    address_prefixes = list(string)
    nsg_key          = optional(string)
  }))
}

variable "enable_firewall" {
  type    = bool
  default = false
}
