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