# Resource Groups Module
module "resource_groups" {
  source = "../../modules/resource-groups"

  # Pass the resource_groups variable from terraform.tfvars to the module
  resource_groups = var.resource_groups
}