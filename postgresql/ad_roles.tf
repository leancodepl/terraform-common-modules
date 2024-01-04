locals {
  ad_roles_setup = <<EOT
    %{for db_name, db in var.databases}
      %{if db.ad_roles != null}
        select * from pgaadauth_create_principal('${db.ad_roles.app_role}', false, false);
        select * from pgaadauth_create_principal('${db.ad_roles.migrations_role}', false, false);
      %{endif}
    %{endfor}
  EOT

  ad_grants_setup = <<EOT
    %{for db_name, db in var.databases}
      %{if db.ad_roles != null}
        \connect ${db_name}

        grant create on database "${db_name}" to "${db.ad_roles.migrations_role}";

        grant "${db.ad_roles.migrations_role}" to "${azurerm_postgresql_flexible_server.main.administrator_login}";

        alter default privileges for role "${db.ad_roles.migrations_role}"
        grant select, insert, update, delete, truncate
        on tables
        to "${db.ad_roles.app_role}";

        alter default privileges for role "${db.ad_roles.migrations_role}"
        grant usage, select
        on sequences
        to "${db.ad_roles.app_role}";

        alter default privileges for role "${db.ad_roles.migrations_role}"
        grant execute
        on routines
        to "${db.ad_roles.app_role}";

        alter default privileges for role "${db.ad_roles.migrations_role}"
        grant usage
        on types
        to "${db.ad_roles.app_role}";

        alter default privileges for role "${db.ad_roles.migrations_role}"
        grant usage
        on schemas
        to "${db.ad_roles.app_role}";

        revoke "${db.ad_roles.migrations_role}" from "${azurerm_postgresql_flexible_server.main.administrator_login}";
      %{endif}
    %{endfor}
    EOT

  flattened_ad_roles = flatten([for db_name, db in var.databases : [
    {
      database = db_name,
      name     = db.ad_roles.migrations_role
    },
    {
      database = db_name,
      name     = db.ad_roles.app_role
    }
  ] if db.ad_roles != null])
}

output "ad_roles" {
  value = { for role in local.flattened_ad_roles : role.name =>
    {
      name     = role.name
      database = role.database

      npg_connection_string = join("", [
        "Host=${azurerm_postgresql_flexible_server.main.fqdn};SSL Mode=VerifyFull;",
        "Database=${azurerm_postgresql_flexible_server_database.databases[role.database].name};",
        "Username=${role.name};",
      ])
  } }
}

output "ad_setup_script" {
  value = file("${path.module}/provision_psql.sh")
}

output "ad_setup_config" {
  value = {
    ad_roles_setup_script  = local.ad_roles_setup
    ad_grants_setup_script = local.ad_grants_setup
    config = {
      fqdn                   = azurerm_postgresql_flexible_server.main.fqdn
      administrator_login    = azurerm_postgresql_flexible_server.main.administrator_login
      administrator_password = azurerm_postgresql_flexible_server.main.administrator_password
      ad_administrator_login = azurerm_postgresql_flexible_server_active_directory_administrator.admin.principal_name
      tenant_id              = azurerm_postgresql_flexible_server_active_directory_administrator.admin.tenant_id
    }
  }
}
