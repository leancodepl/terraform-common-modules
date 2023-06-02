resource "azurerm_key_vault_access_policy" "key_vault_app_access" {
  key_vault_id = var.key_vault_id

  tenant_id = var.key_vault_access_policy.tenant_id
  object_id = var.key_vault_access_policy.object_id

  key_permissions         = coalesce(var.key_vault_access_policy.key_permissions, ["Get", "List", "Sign", "Verify"])
  secret_permissions      = coalesce(var.key_vault_access_policy.secret_permissions, ["Get", "List"])
  certificate_permissions = var.key_vault_access_policy.secret_permissions
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each = nonsensitive(var.key_vault_secrets)

  key_vault_id = var.key_vault_id
  depends_on   = [var.key_vault_deploy_policy_depends_on]

  name  = each.key
  value = each.value
}
