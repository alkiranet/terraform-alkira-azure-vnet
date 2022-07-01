## Customized routing
By default, Alkira will override the existing default route and route the traffic to the _CXP_. As an alternative, you can provide a list of prefixes for which traffic must be routed. It may be desired also to bypass routing to the _CXP_ for specific Azure services.

### Usage
Add the option **custom_prefixes = []** to the configuration. These prefixes must already exist in Alkira. You can bypass specific services by adding **service_tags = []** to the configuration. Available service tags can be found [here.](https://docs.microsoft.com/en-us/azure/virtual-network/service-tags-overview#available-service-tags)

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.8.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_vnet"></a> [azure\_vnet](#module\_azure\_vnet) | alkiranet/azure-vnet/alkira | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->