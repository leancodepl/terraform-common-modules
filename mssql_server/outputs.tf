output "mssql_server_id" {
  value = azurerm_mssql_server.main.id
}

output "mssql_server_fqnd" {
  value = azurerm_mssql_server.main.fully_qualified_domain_name
}

output "mssql_server_sa_password" {
  value     = random_password.db_sa.result
  sensitive = true
}

output "mssql_databases" {
  value = azurerm_mssql_database.databases
}
