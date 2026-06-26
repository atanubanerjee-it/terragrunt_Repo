include "root" {
  path = "../../terragrunt.hcl"
}

locals {
  env = yamldecode(file("../env.yaml"))
}

terraform {
  source = "../../../modules/azure_network"
}

inputs = {
  resource_group_name = local.env.network.resource_group_name
  location            = local.env.location
  vnet_name           = local.env.network.vnet_name
  address_space       = local.env.network.address_space
  subnet_name         = local.env.network.subnet_name
  subnet_prefixes     = local.env.network.subnet_prefixes
  tags                = local.env.network.tags
}
