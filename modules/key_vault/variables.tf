variable "key_vault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "synapse_identity_id" {
  type = string
}

variable "adf_identity_id" {
  type = string
}


variable "synapse_sql_password" {
  type        = string
  default     = "TempP@ssword123!"  # Optional: make it a secret later
}

