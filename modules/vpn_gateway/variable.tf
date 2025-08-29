variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP for the VPN Gateway"
  type        = string
}

variable "gateway_name" {
  description = "Name of the Azure Virtual Network Gateway"
  type        = string
}

variable "gateway_subnet_id" {
  description = "ID of the GatewaySubnet inside your VNet"
  type        = string
}
variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}
