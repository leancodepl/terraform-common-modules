module "mssql_server" {
  source = "../mssql_server"

  server_name         = "terraform-common-modules-sql"
  resource_group_name = azurerm_resource_group.main.name
  sa_login            = "test_sa"

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

  databases = {
    "app_db" = {
      sku       = "Basic"
      collation = "Latin1_General_CI_AS"
    }
  }

  tags = module.tags.tags
}

module "mssql_user" {
  source = "../mssql_database_user"

  database = {
    name = module.mssql_server.mssql_databases["app_db"].name
    fqdn = module.mssql_server.mssql_server_fqnd
  }

  user = {
    name      = "app_user"
    client_id = module.managed_identity.managed_identity.client_id
  }

  roles = ["db_datawriter"]
}
