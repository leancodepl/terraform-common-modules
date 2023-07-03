output "postresql_server_id" {
  value = azurerm_postgresql_flexible_server.main.id
}

output "server_id" {
  value = azurerm_postgresql_flexible_server.main.id
}

output "server_fqdn" {
  value = azurerm_postgresql_flexible_server.main.fqdn
}

output "administrator_login" {
  value = azurerm_postgresql_flexible_server.main.administrator_login
}

output "administrator_password" {
  value = azurerm_postgresql_flexible_server.main.administrator_password
}

output "roles" {
  value = { for role_name, role in local.all_roles : role_name => {
    name     = role_name
    password = postgresql_role.roles[role_name].password
    database = role.database

    npg_connection_string = join("", [
      "Host=${azurerm_postgresql_flexible_server.main.fqdn};SSL Mode=VerifyFull;",
      "Database=${azurerm_postgresql_flexible_server_database.databases[role.database].name};",
      "Username=${postgresql_role.roles[role_name].name};",
      "Password='${postgresql_role.roles[role_name].password}'"
    ])

    libpg_uri_connection_string = join("", [
      "postgresql://${urlencode(postgresql_role.roles[role_name].name)}:${urlencode(postgresql_role.roles[role_name].password)}",
      "@${azurerm_postgresql_flexible_server.main.fqdn}/${azurerm_postgresql_flexible_server_database.databases[role.database].name}",
      "?sslmode=verify-full"
    ])
    }
  }
}
