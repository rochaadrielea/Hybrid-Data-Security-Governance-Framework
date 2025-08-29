output "identity_principal_id" {
  value = azurerm_synapse_workspace.this.identity[0].principal_id
}