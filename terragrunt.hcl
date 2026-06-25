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
      subscription_id = "6b699c29-ba9f-426e-9979-c2e636620141"
      tenant_id       = "e684b531-c77c-48da-aac5-53d36af0d436"
      use_msi         = true
      client_id       = "55419bd1-4c4c-434d-8a54-881c981efa20"
    }
  EOF
}
