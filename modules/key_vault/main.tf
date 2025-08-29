resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard" #Binds the vault to your **Azure AD tenant** — required for role-based access and encryption.
  purge_protection_enabled    = true # Purge protection: even subscription owner can’t hard-delete without waiting 7 days
  soft_delete_retention_days  = 7 # Soft delete: allows recovery of deleted vaults within 7 days

  enabled_for_disk_encryption = true
  enable_rbac_authorization   = true # Enables RBAC for access control, allowing you to use Azure AD roles instead of legacy access policies
}

data "azurerm_client_config" "current" {}
# 🔐 Store the Synapse SQL Admin Password
resource "azurerm_key_vault_secret" "synapse_password" {
  name         = "synapse-sql-password"
  value        = var.synapse_sql_password
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [azurerm_role_assignment.current_user_kv_access]
}

# 📦 Store the Storage Account Key (auto-fetched)
data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_secret" "storage_key" {
  name         = "storage-account-key"
  value        = data.azurerm_storage_account.this.primary_access_key
  key_vault_id = azurerm_key_vault.this.id

  
  depends_on = [azurerm_role_assignment.current_user_kv_access]
}

resource "azurerm_role_assignment" "synapse_kv" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.synapse_identity_id

  
}

resource "azurerm_role_assignment" "current_user_kv_access" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = "fdba911d-f9c3-401b-aedf-c733f8f59492"
}
