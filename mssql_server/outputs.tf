output "mssql_server_id" {
  value = azurerm_mssql_server.main.id
}

output "mssql_server_fqnd" {
  value = azurerm_mssql_server.main.fully_qualified_domain_name
}
