# Alkira Azure Connector - Terraform Module
This module makes it easy to provision an [Azure Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and connect it through [Alkira](htts://alkira.com).

## What it does
- Build a [VNet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and one or more [subnets](https://docs.microsoft.com/en-us/azure/virtual-network/network-overview#virtual-network-and-subnets)
- Create an [Alkira Connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_azure_vnet) for the new VNet
- Apply an existing [Billing Tag](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) to the connector
- Place resources in an existing [segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) and [group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.8.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alkira"></a> [alkira](#provider\_alkira) | >= 0.8.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alkira_connector_azure_vnet.connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_azure_vnet) | resource |
| [azurerm_subnet.azure_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [alkira_billing_tag.tag](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) | data source |
| [alkira_credential.credential](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/credential) | data source |
| [alkira_group.group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group) | data source |
| [alkira_policy_prefix_list.prefix](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/policy_prefix_list) | data source |
| [alkira_segment.segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_tag"></a> [billing\_tag](#input\_billing\_tag) | Alkira - billing tag | `string` | n/a | yes |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Address space of cloud network | `string` | n/a | yes |
| <a name="input_credential"></a> [credential](#input\_credential) | Alkira - cloud credential | `string` | n/a | yes |
| <a name="input_custom_prefixes"></a> [custom\_prefixes](#input\_custom\_prefixes) | Controls if custom prefixes are used for routing from cloud network to CXP; If values are provided, local var 'is\_custom' changes to 'true' | `list(string)` | `[]` | no |
| <a name="input_cxp"></a> [cxp](#input\_cxp) | Alkira - CXP to add connector to | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | Alkira - group to add connector to | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of cloud network and Alkira connector | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Azure resource group | `string` | n/a | yes |
| <a name="input_segment"></a> [segment](#input\_segment) | Alkira - segment to add connector to | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Alkira - connector size | `string` | `"SMALL"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets to create for cloud network | `list(map(string))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_cxp"></a> [connector\_cxp](#output\_connector\_cxp) | CXP that connector was provisioned in |
| <a name="output_connector_group"></a> [connector\_group](#output\_connector\_group) | Group that connector was added to |
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | ID of the connector |
| <a name="output_connector_name"></a> [connector\_name](#output\_connector\_name) | Name of the connector |
| <a name="output_connector_segment_id"></a> [connector\_segment\_id](#output\_connector\_segment\_id) | Segment that connector was placed in |
| <a name="output_connector_size"></a> [connector\_size](#output\_connector\_size) | Size of the connector |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Azure subnet configuration |
| <a name="output_vnet_cidr"></a> [vnet\_cidr](#output\_vnet\_cidr) | Azure VNet address space |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | Azure VNet ID |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | Azure VNet name |
| <a name="output_vnet_region"></a> [vnet\_region](#output\_vnet\_region) | Azure VNet region |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
