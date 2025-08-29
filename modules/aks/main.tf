resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.aks_name}"

  default_node_pool {
    name       = "systempool"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  network_profile {
    network_plugin = "azure"
  }

  tags = {
    environment = "securebridge"
  }
}

output "aks_identity_principal_id" {
  value = azurerm_kubernetes_cluster.this.identity[0].principal_id
}
