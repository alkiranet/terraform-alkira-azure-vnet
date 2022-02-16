# Alkira Azure Connector - Terraform Module
This module makes it easy to provision an [Azure Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and connect it through [Alkira](htts://alkira.com).

## What it does
- Build a [VNet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and one or more [subnets](https://docs.microsoft.com/en-us/azure/virtual-network/network-overview#virtual-network-and-subnets)
- Create an [Alkira Connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_azure_vnet) for the new VNet
- Apply [Billing Tags](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) to the connector
- Place resources in an existing [segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) and [group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group)

## Example Usage
Alkira offers enhanced capabilities for how traffic gets routed to and from _Cloud Exchange Points (CXPs)_.

### Onboard VNet (Default Options)
By default, all traffic gets routed from a given _virtual network_ to Alkira CXP using the _default-route_.

```hcl
module "azure_vnet" {
  source = "alkiranet/azure-vnet/alkira"

  name           = "vnet-east"
  cidr           = "10.1.0.0/16"
  resource_group = "resource-group"

  subnets = [
    {
      name = "subnet-01"
      cidr = "10.1.1.0/24"
    },

    {
      name = "subnet-02"
      cidr = "10.1.2.0/24"
    }
  ]

  cxp          = "US-EAST-2"
  segment      = "corporate"
  group        = "nonprod"
  credential   = "azure-auth"
  billing_tags = ["cloud", "network"]

}
```

### Custom Routing
As an alternative, you can provide a list of prefixes for which traffic must be routed. This can be done by adding **custom_prefixes = []** to the configuration. It may be desired also to bypass routing to the _CXP_ for specific Azure services. You can _exclude_ services by adding **service_tags = []** to the configuration. Available service tags can be found [here.](https://docs.microsoft.com/en-us/azure/virtual-network/service-tags-overview#available-service-tags)

```hcl
module "azure_vnet" {
  source = "alkiranet/azure-vnet/alkira"

  name            = "vnet-east"
  cidr            = "10.1.0.0/16"
  resource_group  = "resource-group"
  custom_prefixes = ["pfx-01", "pfx-02"]

  subnets = [
    {
      name = "subnet-01"
      cidr = "10.1.1.0/24"
    },

    {
      name = "subnet-02"
      cidr = "10.1.2.0/24"
    }
  ]

  cxp          = "US-EAST-2"
  segment      = "corporate"
  group        = "nonprod"
  credential   = "azure-auth"
  billing_tags = ["cloud", "network"]
  service_tags = ["AzureDatabricks", "AppService", "AzureKeyVault"]

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.8.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alkira"></a> [alkira](#provider\_alkira) | >= 0.8.1 |
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
| <a name="input_billing_tags"></a> [billing\_tags](#input\_billing\_tags) | List of billing tag names to apply to connector | `list(string)` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Address space of cloud network | `string` | n/a | yes |
| <a name="input_credential"></a> [credential](#input\_credential) | Alkira - cloud credential | `string` | n/a | yes |
| <a name="input_custom_prefixes"></a> [custom\_prefixes](#input\_custom\_prefixes) | Controls if custom prefixes are used for routing from cloud network to CXP; If values are provided, local var 'is\_custom' changes to 'true' | `list(string)` | `[]` | no |
| <a name="input_cxp"></a> [cxp](#input\_cxp) | Alkira - CXP to add connector to | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Status of connector; Default is true | `bool` | `true` | no |
| <a name="input_group"></a> [group](#input\_group) | Alkira - group to add connector to | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of cloud network and Alkira connector | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Azure resource group | `string` | n/a | yes |
| <a name="input_segment"></a> [segment](#input\_segment) | Alkira - segment to add connector to | `string` | n/a | yes |
| <a name="input_service_tags"></a> [service\_tags](#input\_service\_tags) | List of Azure Service Tags which excludes those services from routing via Alkira | `list(string)` | `[]` | no |
| <a name="input_size"></a> [size](#input\_size) | Alkira - connector size | `string` | `"SMALL"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets to create for cloud network | `list(map(string))` | <pre>[<br>  {}<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_region"></a> [azure\_region](#output\_azure\_region) | Azure Region |
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | ID of the connector |
| <a name="output_cxp"></a> [cxp](#output\_cxp) | CXP that connector was provisioned in |
| <a name="output_group"></a> [group](#output\_group) | Group that connector was added to |
| <a name="output_name"></a> [name](#output\_name) | Network name |
| <a name="output_segment_id"></a> [segment\_id](#output\_segment\_id) | Segment that connector was placed in |
| <a name="output_size"></a> [size](#output\_size) | Size of the connector |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Azure subnet configuration |
| <a name="output_vnet_cidr"></a> [vnet\_cidr](#output\_vnet\_cidr) | Azure VNet CIDR |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | Azure VNet ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
