resource "random_password" "db_sa" {
  length  = 64
  special = false

  keepers = {
    env = var.server_name
    rg  = data.azurerm_resource_group.main.id
  }
}

# tfsec:ignore:azure-database-no-public-access
# tfsec:ignore:azure-database-enable-audit
resource "azurerm_mssql_server" "main" {

  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  name                = var.server_name
  version             = "12.0"

  administrator_login          = var.sa_login
  administrator_login_password = random_password.db_sa.result

  minimum_tls_version = "1.2"

  azuread_administrator {
    tenant_id      = var.ad_admin.tenant_id
    object_id      = var.ad_admin.object_id
    login_username = var.ad_admin.display_name
  }

  tags = var.tags
}
