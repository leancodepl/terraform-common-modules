resource "azurerm_user_assigned_identity" "identity" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = coalesce(var.location, data.azurerm_resource_group.main.location)

  name = var.managed_identity_name
  tags = var.tags
}

resource "azurerm_federated_identity_credential" "identity_credential" {
  parent_id           = azurerm_user_assigned_identity.identity.id
  name                = "${kubernetes_service_account_v1.service_account.metadata[0].name}-k8s-access"
  resource_group_name = data.azurerm_resource_group.main.name

  audience = ["api://AzureADTokenExchange"]
  subject  = "system:serviceaccount:${kubernetes_service_account_v1.service_account.metadata[0].namespace}:${kubernetes_service_account_v1.service_account.metadata[0].name}"
  issuer   = data.azurerm_kubernetes_cluster.cluster.oidc_issuer_url
}

resource "azurerm_role_assignment" "identity_roles" {
  for_each = var.azure_role_assignments

  principal_id = azurerm_user_assigned_identity.identity.principal_id

  scope                = each.value.scope
  role_definition_name = each.value.role_name
}
