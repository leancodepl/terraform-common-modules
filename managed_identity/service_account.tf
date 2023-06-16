resource "kubernetes_service_account_v1" "service_account" {
  metadata {
    name      = coalesce(var.service_account_name, var.managed_identity_name)
    namespace = var.kubernetes.namespace
    annotations = {
      "azure.workload.identity/client-id" = azurerm_user_assigned_identity.identity.client_id
    }
    labels = {
      "azure.workload.identity/use" = true
    }
  }
}
