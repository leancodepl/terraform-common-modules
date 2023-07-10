resource "azurerm_key_vault" "main" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  name                = var.name
  sku_name            = "standard"
  tenant_id           = var.owner_access_policy.tenant_id

  purge_protection_enabled   = true
  soft_delete_retention_days = var.soft_delete_retention_days


  network_acls {
    bypass                     = "None"
    default_action             = var.network_acls.allow_all ? "Allow" : "Deny" #tfsec:ignore:azure-keyvault-specify-network-acl
    virtual_network_subnet_ids = var.network_acls.subnet_ids
    ip_rules                   = var.network_acls.ip_ranges
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "owner_access_to_main_keyvault" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.owner_access_policy.tenant_id
  object_id    = var.owner_access_policy.object_id

  key_permissions         = coalesce(var.owner_access_policy.key_permissions, ["Get", "List", "Update", "Create", "Delete", "Encrypt", "Decrypt"])
  secret_permissions      = coalesce(var.owner_access_policy.secret_permissions, ["List", "Get", "Set", "Delete", "Recover", "Purge"])
  certificate_permissions = var.owner_access_policy.certificate_permissions
}
