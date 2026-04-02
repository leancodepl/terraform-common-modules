module "managed_identity" {
  source = "../managed_identity"

  azure_resource_group  = azurerm_resource_group.main.name
  managed_identity_name = "test-identity"

  kubernetes = {
    azure_resource_group    = var.azure.aks_resource_group_name
    kubernetes_service_name = var.azure.aks_name
    namespace               = kubernetes_namespace_v1.main.metadata[0].name
  }

  azure_role_assignments = {}

  tags = module.tags.tags

  depends_on = [azurerm_resource_group.main]
}

module "migrations" {
  source = "../managed_identity"

  azure_resource_group  = azurerm_resource_group.main.name
  managed_identity_name = "test-migrations"

  kubernetes = {
    azure_resource_group    = var.azure.aks_resource_group_name
    kubernetes_service_name = var.azure.aks_name
    namespace               = kubernetes_namespace_v1.main.metadata[0].name
  }

  azure_role_assignments = {}
  tags                   = module.tags.tags

  depends_on = [azurerm_resource_group.main]
}
