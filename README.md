# Alkira Azure Connector - Terraform Module
This module makes it easy to provision an [Azure Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and connect it through [Alkira](htts://alkira.com).

## What it does
- Build a [VNet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and one or more [subnets](https://docs.microsoft.com/en-us/azure/virtual-network/network-overview#virtual-network-and-subnets)
- Create an [Alkira Connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_azure_vnet) for the new VNet
- Apply an existing [Billing Tag](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) to the connector
- Place resources in an existing [segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) and [group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->