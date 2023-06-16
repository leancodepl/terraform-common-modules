resource "random_password" "db_sa" {
  length  = 64
  special = false

  keepers = {
    env = var.server_name
    rg  = data.azurerm_resource_group.main.id
  }
}

resource "azurerm_mssql_server" "main" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  name                = var.server_name
  version             = "12.0"

  administrator_login          = var.sa_login
  administrator_login_password = random_password.db_sa.result

  azuread_administrator {
    tenant_id      = var.ad_admin.tenant_id
    object_id      = var.ad_admin.object_id
    login_username = var.ad_admin.display_name
  }

  tags = var.tags
}
