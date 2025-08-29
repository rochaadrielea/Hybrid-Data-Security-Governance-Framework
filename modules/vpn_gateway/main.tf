
#VPN gateway needs to be reachable from outside Without a public IP, on-prem has no address to dial into.


resource "azurerm_public_ip" "vpn_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"  
}

#Azure endpoint of your secure tunnel, The VPN Gateway is the actual router and encryption/decryption endpoint inside Azure.

resource "azurerm_virtual_network_gateway" "vpn_gw" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased" #Works with dynamic IPs, ideal for modern use
  active_active       = false
  enable_bgp          = false #You're not using BGP (Border Gateway Protocol), which is for complex routing with external devices (not needed for this demo).
  sku                 = "VpnGw1" #VpnGw1 is a balanced tier (cost vs performance).

  ip_configuration {
    name                          = "vpnGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
}
