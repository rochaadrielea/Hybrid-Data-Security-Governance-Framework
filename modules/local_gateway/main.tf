resource "azurerm_local_network_gateway" "local_gw" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location # or use `var.location` if dynamic
  gateway_address     = var.onprem_public_ip
  address_space       = var.onprem_address_space
}
