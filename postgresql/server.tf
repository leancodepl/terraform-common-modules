resource "random_password" "db_admin" {
  length  = 64
  special = false

  keepers = {
    env = var.server.name
    rg  = var.resource_group.name
  }
}

resource "azurerm_postgresql_flexible_server" "main" {
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  name                   = var.server.name
  version                = var.server.version
  sku_name               = var.server.sku_name
  storage_mb             = var.server.storage_mb
  administrator_login    = var.server.administrator_login
  administrator_password = random_password.db_admin.result

  create_mode = "Default"

  tags = var.tags

  authentication {
    password_auth_enabled         = true
    active_directory_auth_enabled = true
    tenant_id                     = var.ad_admin.tenant_id
  }

  maintenance_window {
    start_hour   = var.maintenance_window.start_hour
    day_of_week  = var.maintenance_window.day_of_week
    start_minute = var.maintenance_window.start_minute
  }

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_postgresql_flexible_server_configuration" "extensions" {
  server_id = azurerm_postgresql_flexible_server.main.id
  name      = "azure.extensions"
  value     = join(",", var.server.extensions)
}

resource "azurerm_postgresql_flexible_server_active_directory_administrator" "admin" {
  resource_group_name = azurerm_postgresql_flexible_server.main.resource_group_name
  server_name         = azurerm_postgresql_flexible_server.main.name

  tenant_id      = var.ad_admin.tenant_id
  object_id      = var.ad_admin.object_id
  principal_name = var.ad_admin.principal_name
  principal_type = var.ad_admin.principal_type
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  count     = var.firewall.allow_all ? 1 : 0
  server_id = azurerm_postgresql_flexible_server.main.id
  name      = "allow-all"

  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall" {
  for_each = var.firewall.ip_rules

  server_id = azurerm_postgresql_flexible_server.main.id
  name      = each.key

  start_ip_address = each.value.start_ip
  end_ip_address   = each.value.end_ip
}

resource "azurerm_postgresql_flexible_server_database" "databases" {
  for_each = var.databases

  server_id = azurerm_postgresql_flexible_server.main.id

  name      = each.key
  charset   = each.value.charset
  collation = each.value.collation
}
