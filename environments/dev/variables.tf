variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

# Define the variable structure - but NO default values here either
variable "resource_groups" {
  description = "Map of resource groups to create in dev environment"
  type = map(object({
    location = string
    tags     = map(string)
  }))
}