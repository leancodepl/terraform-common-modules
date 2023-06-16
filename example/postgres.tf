module "postgresql" {
  source = "../postgresql"

  resource_group = {
    name     = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
  }

  server = {
    name                = "terraform-common-modules"
    storage_mb          = "32768"
    sku_name            = "B_Standard_B1ms"
    version             = "14"
    administrator_login = "TfTest"
  }

  ad_admin = {
    tenant_id      = data.azuread_client_config.current.tenant_id
    object_id      = data.azuread_client_config.current.object_id
    principal_name = "AD Admin"
    principal_type = "User"
  }

  databases = {
    "test_db" = {
      charset   = "UTF8"
      collation = "en_US.utf8"

      roles = {
        "app_user" = {
          privileges = ["CREATE"]
        }
      }

      ad_roles = {
        app_role        = module.managed_identity.managed_identity.name
        migrations_role = module.migrations.managed_identity.name
      }
    }
  }

  firewall = {
    allow_all = true
    ip_rules  = {}
  }

  tags = {}
}

output "postgres_config" {
  value     = module.postgresql.ad_setup_config
  sensitive = true
}
