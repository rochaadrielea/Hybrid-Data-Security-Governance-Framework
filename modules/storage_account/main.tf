resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  https_traffic_only_enabled      = var.enable_https_traffic_only
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = var.allow_blob_public_access
 #blob versioning is for flat namespace blob storage.
 # blob_properties {
  #  versioning_enabled = true
 # }
   lifecycle {
    prevent_destroy = true
  }

  tags = {
    environment = "dev"
    compliance  = "FADP/GDPR"
  }
}