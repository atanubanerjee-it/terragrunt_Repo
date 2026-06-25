variable "resource_group_name" {
  description = "Name of the existing Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to attach the VM NIC to"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "vm_size" {
  description = "Azure VM SKU"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
}

variable "admin_password" {
  description = "Administrator password"
  type        = string
  sensitive   = true
}

variable "os_disk_size_gb" {
  description = "OS disk size"
  type        = number
  default     = 128
}

variable "image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "VM image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "VM image SKU"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "Tags applied to created resources"
  type        = map(string)
  default     = {}
}
