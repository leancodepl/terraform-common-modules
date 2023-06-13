data "mssql_database_role" "roles" {
  for_each = var.roles

  database_id = data.mssql_database.database.id
  name        = each.key
}

resource "mssql_database_role_member" "roles" {
  for_each = toset([for role in data.mssql_database_role.roles : role.id])

  role_id   = each.key
  member_id = mssql_azuread_service_principal.user.id
}
