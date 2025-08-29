resource "azurerm_synapse_workspace" "this" {
  name                                 = var.synapse_name
  location                             = var.location
  resource_group_name                  = var.resource_group_name
  #storage_data_lake_gen2_filesystem_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}/fileServices/default/filesystems/synapse"
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.this.id

  identity {
    type = "SystemAssigned"
  }

  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "TempP@ssword123!" # Replace with Key Vault later

  managed_virtual_network_enabled = true

  tags = {
    environment = "dev"
    compliance  = "FADP/GDPR"
  }
     lifecycle {
    prevent_destroy = true
  }

  
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  name               = var.data_lake_filesystem_name
  storage_account_id = var.storage_account_id
}

data "azurerm_client_config" "current" {}


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

