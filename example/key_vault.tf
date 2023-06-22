module "key_vault" {
  source = "../key_vault"

  name                = "workload-identity-kv"
  resource_group_name = azurerm_resource_group.main.name

  network_acls = {
    allow_all  = true
    ip_ranges  = []
    subnet_ids = []
  }

  owner_access_policy = {
    tenant_id = var.azure.tenant_id
    object_id = data.azuread_client_config.current.object_id
  }

  tags = local.tags

  depends_on = [azurerm_resource_group.main]
}
