resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.network_security_groups

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

locals {
  nsg_rules_flat = flatten([
    for nsg_key, nsg_val in var.network_security_groups : [
      for rule in try(nsg_val.rules, []) : {
        nsg_key                    = nsg_key
        name                       = rule.name
        priority                   = rule.priority
        direction                  = rule.direction
        access                     = rule.access
        protocol                   = rule.protocol
        source_port_range          = rule.source_port_range
        destination_port_range     = rule.destination_port_range
        source_address_prefix      = rule.source_address_prefix
        destination_address_prefix = rule.destination_address_prefix
      }
    ]
  ])
}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each = {
    for rule in local.nsg_rules_flat :
    "${rule.nsg_key}-${rule.name}" => rule
  }

  name                       = each.value.name
  priority                   = each.value.priority
  direction                  = each.value.direction
  access                     = each.value.access
  protocol                   = each.value.protocol
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.value.nsg_key].name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  for_each = {
    for subnet_key, subnet_val in var.subnets :
    subnet_key => subnet_val
    if try(subnet_val.nsg_key, null) != null
  }

  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_key].id
}

resource "azurerm_subnet" "firewall_subnet" {
  count                = var.enable_firewall ? 1 : 0
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.250.0/26"]
}

resource "azurerm_public_ip" "firewall_ip" {
  count               = var.enable_firewall ? 1 : 0
  name                = "fw-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  count               = var.enable_firewall ? 1 : 0
  name                = "vnet-firewall"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "fw-config"
    subnet_id            = azurerm_subnet.firewall_subnet[0].id
    public_ip_address_id = azurerm_public_ip.firewall_ip[0].id
  }
}

