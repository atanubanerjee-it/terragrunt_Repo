include "root" {
  path = "../../terragrunt.hcl"
}

locals {
  env = yamldecode(file("../env.yaml"))
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    resource_group_name = "mock-rg"
    location            = "eastus"
    subnet_id           = "/subscriptions/mock-subscription/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
  }

  mock_outputs_allowed_terraform_commands = ["init", "plan", "validate", "destroy"]
}

terraform {
  source = "../../../modules/azure_vm"
}

inputs = {
  resource_group_name = dependency.network.outputs.resource_group_name
  location            = dependency.network.outputs.location
  subnet_id           = dependency.network.outputs.subnet_id
  vm_name             = local.env.vm.vm_name
  vm_size             = local.env.vm.vm_size
  admin_username      = local.env.vm.admin_username
  admin_password      = local.env.vm.admin_password
  os_disk_size_gb     = local.env.vm.os_disk_size_gb
  image_publisher     = local.env.vm.image_publisher
  image_offer         = local.env.vm.image_offer
  image_sku           = local.env.vm.image_sku
  image_version       = local.env.vm.image_version
  tags                = local.env.vm.tags
}
