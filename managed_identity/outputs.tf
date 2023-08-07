output "managed_identity" {
  value = {
    id        = azurerm_user_assigned_identity.identity.id
    name      = azurerm_user_assigned_identity.identity.name
    client_id = azurerm_user_assigned_identity.identity.client_id
    object_id = azurerm_user_assigned_identity.identity.principal_id
  }
}

output "service_account" {
  value = {
    name      = kubernetes_service_account_v1.service_account.metadata[0].name
    namespace = kubernetes_service_account_v1.service_account.metadata[0].namespace
  }
}
