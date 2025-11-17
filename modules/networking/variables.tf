variable "vnet_name" {
  type        = string
  description = "VNet name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "address_space" {
  type = list(string)
}

############################################
# 1️⃣ INDEPENDENT NSG DEFINITIONS
############################################
variable "network_security_groups" {
  description = "NSGs and their rules"
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

############################################
# 2️⃣ SUBNET DEFINITIONS WITH OPTIONAL NSG
############################################
variable "subnets" {
  description = "Subnet definitions + optional NSG key"
  type = map(object({
    address_prefixes = list(string)
    nsg_key          = optional(string) # nullable
  }))
}

############################################
# 3️⃣ OPTIONAL FIREWALL
############################################
variable "enable_firewall" {
  type    = bool
  default = false
}
