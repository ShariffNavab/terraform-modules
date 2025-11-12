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

    # Static website configuration
    static_website_enabled = optional(bool, false)
    index_document         = optional(string, "index.html")
    error_404_document     = optional(string, "404.html")

    tags = map(string)
  }))
  default = {}
}

variable "containers" {
  description = "Storage container configurations"
  type = map(object({
    storage_account_key = string
    access_type         = string
  }))
  default = {}
}