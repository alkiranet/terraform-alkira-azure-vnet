# Local vars
locals {

  azure_subnets = {
    for subnet in var.subnets :
    try("${subnet.name}/${subnet.cidr}") => subnet
  }

  # If list is empty, set to true
  is_custom = length(var.custom_prefixes) > 0 ? true : false

  # Filter tag IDs
  tag_id_list = [
    for v in data.alkira_billing_tag.tag : v.id
  ]

  # Filter prefix IDs
  pfx_id_list = [
    for v in data.alkira_policy_prefix_list.prefix : v.id
  ]

}

/*
Azure data sources
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
*/
data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

/*
Alkira data sources
https://registry.terraform.io/providers/alkiranet/alkira/latest/docs
*/

data "alkira_segment" "segment" {
  name = var.segment
}

data "alkira_group" "group" {
  name = var.group
}

data "alkira_credential" "credential" {
  name = var.credential
}

data "alkira_billing_tag" "tag" {
  for_each = toset(var.billing_tags)
  name     = each.key
}

data "alkira_policy_prefix_list" "prefix" {
  for_each = toset(var.custom_prefixes)
  name     = each.key
}

# Create Azure VNet
resource "azurerm_virtual_network" "vnet" {

  name                = var.name
  address_space       = [var.cidr]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = data.azurerm_resource_group.rg.tags
}

# Create Azure subnets
resource "azurerm_subnet" "azure_subnet" {

  for_each = local.azure_subnets

  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  name                 = each.value.name
  address_prefixes     = [each.value.cidr]
}

# Connect VNet through Alkira CXP
resource "alkira_connector_azure_vnet" "connector" {

  # Azure values
  name          = var.name
  service_tags  = var.service_tags
  azure_vnet_id = azurerm_virtual_network.vnet.id

  # Connector values
  enabled         = var.enabled
  cxp             = var.cxp
  size            = var.size
  group           = data.alkira_group.group.name
  segment_id      = data.alkira_segment.segment.id
  credential_id   = data.alkira_credential.credential.id
  billing_tag_ids = local.tag_id_list

  /*
  Does custom bool exist?
  If yes, advertise custom prefix and pass through list
  If not, use default route and set option to route custom to null
  */

  # Route table
  routing_options = local.is_custom ? "ADVERTISE_CUSTOM_PREFIX" : "ADVERTISE_DEFAULT_ROUTE"

  # Custom prefixes
  routing_prefix_list_ids = local.is_custom ? local.pfx_id_list : null

}
