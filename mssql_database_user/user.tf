resource "mssql_azuread_service_principal" "user" {
  database_id = data.mssql_database.database.id

  name      = var.user.name
  client_id = var.user.client_id
}
