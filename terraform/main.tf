# HYBRID_SECURITY_BRIDGE/terraform/main.tf

# Entry point: pulls in modules and provides values
provider "azurerm" {
  features {}

  subscription_id = "cdeb01e8-1d02-4dbf-b32a-18e284fc2280"
  tenant_id       = "e509f8bc-3e93-412d-af9a-8cfdcd3cf1e5"
}


module "local_gateway" {
  source = "../modules/local_gateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  gateway_name        = var.local_gateway_name
  onprem_address_space = var.onprem_address_space
  onprem_public_ip    = var.onprem_public_ip
}

module "nsg_rules" {
  source = "../modules/nsg_rules"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  hr_blocked_ip       = var.hr_blocked_ip
}

module "vpn_gateway" {
  source = "../modules/vpn_gateway"
  resource_group_name = var.resource_group_name
  location             = var.location
  vnet_name            = var.vnet_name
  public_ip_name       = var.public_ip_name
  gateway_name         = var.gateway_name
  gateway_subnet_id    = var.gateway_subnet_id
}

module "data_factory" {
  source               = "../modules/data_factory"
  location             = var.location
  resource_group_name  = var.resource_group_name
  data_factory_name    = var.data_factory_name
 
}

module "key_vault" {
  source                = "../modules/key_vault"
  resource_group_name   = var.resource_group_name
  location              = var.location
  key_vault_name        = var.key_vault_name
  storage_account_name  = var.storage_account_name
  synapse_identity_id   = module.synapse.identity_principal_id
  adf_identity_id       = module.data_factory.identity_principal_id
  
}

module "synapse" {
  source               = "../modules/synapse"
  resource_group_name  = var.resource_group_name
  location             = var.location
  synapse_name         = var.synapse_name
  storage_account_name = var.storage_account_name


  data_lake_storage_url     = var.data_lake_storage_url
  data_lake_filesystem_name = var.data_lake_filesystem_name
  storage_account_id        = module.storage_account.storage_account_id
}
module "storage_account" {
  source              = "../modules/storage_account"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = var.storage_account_name
}






module "purview" {
  source              = "../modules/purview"
  resource_group_name = var.resource_group_name
  location            = var.location
  purview_account_name = var.purview_account_name
}

module "defender" {
  source = "../modules/defender"
}


# module "aks" {
#   source              = "../modules/aks"
#   aks_name            = var.aks_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
# }






