resource "azurerm_data_factory" "this" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
    compliance  = "FADP/GDPR"
  }
}

# # 🧑‍💼 Access Policy for Synapse Managed Identity
# resource "azurerm_key_vault_access_policy" "synapse_access" {
#   key_vault_id = azurerm_key_vault.this.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = var.synapse_identity_id

#   secret_permissions = [
#     "get", "list"
#   ]
# }

# # 🧑‍💼 Access Policy for Data Factory Managed Identity
# resource "azurerm_key_vault_access_policy" "adf_access" {
#   key_vault_id = azurerm_key_vault.this.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = var.adf_identity_id

#   secret_permissions = [
#     "get", "list"
#   ]
# }

