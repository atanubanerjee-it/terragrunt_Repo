# Azure Terragrunt + Terraform demo

This workspace contains a minimal Terragrunt setup for deploying:
- an Azure resource group
- a VNet and one subnet
- an Ubuntu VM attached to that subnet

## Structure

- terragrunt.hcl — shared Terragrunt settings and Azure provider generation
- infra/dev/network/terragrunt.hcl — deploys the network module
- infra/dev/vm/terragrunt.hcl — deploys the VM module and depends on the network
- modules/azure_network/ — reusable Terraform network module
- modules/azure_vm/ — reusable Terraform VM module

## Prerequisites

1. Install Terraform and Terragrunt.
2. Authenticate to Azure with the Azure CLI or service principal credentials.
3. Export your Azure subscription and tenant values if needed:

   export ARM_SUBSCRIPTION_ID="<subscription-id>"
   export ARM_TENANT_ID="<tenant-id>"
   export ARM_CLIENT_ID="<client-id>"
   export ARM_CLIENT_SECRET="<client-secret>"

## Deploy

From the workspace root:

1. terragrunt run-all plan
2. terragrunt run-all apply

To destroy the environment:

1. terragrunt run-all destroy

## Notes

- The VM uses a password for simplicity in this demo. For production, prefer SSH keys and secret management.
- Replace the placeholder values with your own naming, region, and security preferences.
