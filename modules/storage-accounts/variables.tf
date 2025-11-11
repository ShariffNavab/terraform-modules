variable "storage_accounts" {
  description = "Map of storage account configurations"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string
    
    # Static website configuration
    static_website_enabled = optional(bool, false)
    index_document         = optional(string, "index.html")
    error_404_document     = optional(string, "404.html")
    
    tags                   = map(string)
  }))
}

variable "containers" {
  description = "Map of storage container configurations"
  type = map(object({
    storage_account_key = string
    access_type         = string
  }))
  default = {}
}