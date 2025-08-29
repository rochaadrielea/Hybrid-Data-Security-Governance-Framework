resource "azurerm_purview_account" "this" {
  name                = var.purview_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
    compliance  = "FADP/GDPR"
  }
}
