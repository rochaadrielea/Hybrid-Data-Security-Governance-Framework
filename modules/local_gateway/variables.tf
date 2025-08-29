variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "gateway_name" {
  type = string
}

variable "onprem_address_space" {
  type = list(string)
}

variable "onprem_public_ip" {
  type = string
}
