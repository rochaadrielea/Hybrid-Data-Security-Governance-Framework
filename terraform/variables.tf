variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
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

variable "local_gateway_name" {
  description = "Name of the Local Network Gateway"
  type        = string
}

variable "onprem_address_space" {
  description = "List of address spaces for the on-premises network"
  type        = list(string)
}

variable "onprem_public_ip" {
  description = "Public IP address of the on-premises VPN device"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the NSG rules will be applied"
  type        = string
}

variable "hr_blocked_ip" {
  description = "IP address to block for HR security"
  type        = string
}
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  
}
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  
}

variable "synapse_name" {
  type = string
}

variable "purview_account_name" {
  type = string
}
variable "data_lake_storage_url" {
  description = "The URL of the Data Lake Storage account"
  type        = string
}

variable "data_lake_filesystem_name" {
  description = "Name of the Data Lake Filesystem for Synapse"
  type        = string
}

variable "data_factory_name" {
  description = "The name of the Azure Data Factory"
  type        = string
}
variable "aks_name" {
  type = string
}