variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "enable_https_traffic_only" {
  type    = bool
  default = true
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "allow_blob_public_access" {
  type    = bool
  default = false
}

