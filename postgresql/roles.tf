locals {
  all_roles_flat = flatten([for db_name, db in var.databases : [
    for role_name, role in db.roles : {
      name       = role_name
      database   = db_name
      roles      = role.roles
      privileges = role.privileges
    }
  ]])

  all_roles = { for role in local.all_roles_flat : role.name => role }
}

resource "random_password" "roles" {
  for_each = local.all_roles

  length  = 64
  special = false

  keepers = {
    server = azurerm_postgresql_flexible_server.main.id
  }
}

resource "postgresql_role" "roles" {
  for_each = local.all_roles

  login    = true
  name     = each.key
  password = random_password.roles[each.key].result

  roles = each.value.roles
}

resource "postgresql_grant" "database_grants" {
  for_each = local.all_roles

  database    = azurerm_postgresql_flexible_server_database.databases[each.value.database].name
  role        = postgresql_role.roles[each.value.name].name
  object_type = "database"
  privileges  = each.value.privileges
}
