# Resource Groups Module
module "resource_groups" {
  source = "../../modules/resource-groups"

  resource_groups = var.resource_groups
}

# Storage Account Module

module "storage_accounts" {
  source           = "../../modules/storage-accounts"
  storage_accounts = var.storage_accounts
  containers       = var.containers
  # UNCOMMENT ONLY IF using Terraform-managed RGs (created by module.resource_groups for this execution)
  # depends_on = [module.resource_groups]
}

module "virtual_network" {
  source = "../../modules/networking"

  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  network_security_groups = var.network_security_groups
  subnets                 = var.subnets

  enable_firewall = var.enable_firewall
  # UNCOMMENT ONLY IF using Terraform-managed RGs (created by module.resource_groups for this execution)
  # depends_on = [module.resource_groups]
}
