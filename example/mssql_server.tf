module "mssql_server" {
  source = "../mssql-server"

  server_name         = "terraform-common-modules-sql"
  resource_group_name = azurerm_resource_group.main.name

  firewall = {
    allow_all    = true
    ip_rules     = {}
    subnet_rules = {}
  }

  ad_admin = {
    display_name = "AD Admin"
    tenant_id    = data.azuread_client_config.current.tenant_id
    object_id    = data.azuread_client_config.current.object_id
  }

  tags     = {}
  sa_login = "test_sa"
}

resource "azurerm_mssql_database" "database" {
  server_id = module.mssql_server.mssql_server_id
  name      = "app_db"
  sku_name  = "Basic"
}

module "mssql_user" {
  source = "../mssql-database-user"

  database = {
    name = azurerm_mssql_database.database.name
    fqdn = module.mssql_server.mssql_server_fqnd
  }

  user = {
    name      = "app_user"
    client_id = module.managed_identity.managed_identity.client_id
  }

  roles = ["db_datawriter"]
}
