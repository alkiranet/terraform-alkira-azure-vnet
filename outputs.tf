output "vnet_name" {
  description = "Azure VNet name"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "Azure VNet ID"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_region" {
  description = "Azure VNet region"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_cidr" {
  description = "Azure VNet address space"
  value       = azurerm_virtual_network.vnet.address_space
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

output "connector_name" {
  description = "Name of the connector"
  value       = alkira_connector_azure_vnet.connector.name
}

output "connector_cxp" {
  description = "CXP that connector was provisioned in"
  value       = alkira_connector_azure_vnet.connector.cxp
}

output "connector_size" {
  description = "Size of the connector"
  value       = alkira_connector_azure_vnet.connector.size
}

output "connector_segment_id" {
  description = "Segment that connector was placed in"
  value       = alkira_connector_azure_vnet.connector.segment_id
}

output "connector_group" {
  description = "Group that connector was added to"
  value       = alkira_connector_azure_vnet.connector.group
}