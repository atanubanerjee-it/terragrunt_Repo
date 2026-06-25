variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_prefixes" {
  description = "CIDR prefixes for the subnet"
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to created resources"
  type        = map(string)
  default     = {}
}
