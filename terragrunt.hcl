locals {
  environment = "dev"
  location    = "eastus"
  tags = {
    environment = local.environment
    managed_by  = "terragrunt"
    project     = "azure-terragrunt-demo"
  }
}

remote_state {
  backend = "azurerm"

  config = {
    resource_group_name  = "atanu-rg"
    storage_account_name = "terragruntstategpv2"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      required_version = ">= 1.5.0"

      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 3.111"
        }
      }

      backend "azurerm" {}
    }

    provider "azurerm" {
      features {}
      use_msi = true
      subscription_id = lookup(env, "ARM_SUBSCRIPTION_ID", null)
      tenant_id       = lookup(env, "ARM_TENANT_ID", null)
      client_id       = lookup(env, "ARM_CLIENT_ID", null)
    }
  EOF
}
