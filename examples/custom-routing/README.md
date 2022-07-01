## Customized routing
By default, Alkira will override the existing default route and route the traffic to the _CXP_. As an alternative, you can provide a list of prefixes for which traffic must be routed. It may be desired also to bypass routing to the _CXP_ for specific Azure services.

### Usage
Add the option **custom_prefixes = []** to the configuration. These prefixes must already exist in Alkira. You can bypass specific services by adding **service_tags = []** to the configuration. Available service tags can be found [here.](https://docs.microsoft.com/en-us/azure/virtual-network/service-tags-overview#available-service-tags)

```bash
$ terraform init
$ terraform plan
$ terraform apply
```