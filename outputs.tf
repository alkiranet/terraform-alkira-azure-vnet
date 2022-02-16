output "name" {
  description = "Network name"
  value       = var.name
}

output "vnet_id" {
  description = "Azure VNet ID"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_cidr" {
  description = "Azure VNet CIDR"
  value       = azurerm_virtual_network.vnet.address_space
}

output "azure_region" {
  description = "Azure Region"
  value       = azurerm_virtual_network.vnet.location
}

output "subnet" {
  description = "Azure subnet configuration"
  value = [
    for subnet in azurerm_subnet.azure_subnet : {
      subnet_id   = subnet.id
      subnet_name = subnet.name
      subnet_cidr = subnet.address_prefixes
    }
  ]
}

output "connector_id" {
  description = "ID of the connector"
  value       = alkira_connector_azure_vnet.connector.id
}

output "cxp" {
  description = "CXP that connector was provisioned in"
  value       = alkira_connector_azure_vnet.connector.cxp
}

output "size" {
  description = "Size of the connector"
  value       = alkira_connector_azure_vnet.connector.size
}

output "segment_id" {
  description = "Segment that connector was placed in"
  value       = alkira_connector_azure_vnet.connector.segment_id
}

output "group" {
  description = "Group that connector was added to"
  value       = alkira_connector_azure_vnet.connector.group
}
