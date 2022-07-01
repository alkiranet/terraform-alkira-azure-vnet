module "azure_vnet" {
  source = "alkiranet/azure-vnet/alkira"

  name           = "vnet-east"
  cidr           = "10.5.0.0/16"
  resource_group = "resource-group"

  subnets = [
    {
      name = "app-subnet-a"
      cidr = "10.5.1.0/24"
    },
    {
      name = "app-subnet-b"
      cidr = "10.5.2.0/24"
    }
  ]

  cxp          = "US-EAST-2"
  segment      = "corporate"
  group        = "non-prod"
  billing_tags = ["cloud", "network"]
  credential   = "azure-auth"

}