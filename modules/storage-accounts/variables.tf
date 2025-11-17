variable "storage_accounts" {
  description = "Map of storage account configurations"
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