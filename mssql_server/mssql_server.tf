resource "random_password" "db_sa" {
  length  = 64
  special = false

  keepers = {
    env = var.server_name
    rg  = data.azurerm_resource_group.main.id
  }
}

resource "azurerm_mssql_server" "main" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  name                = var.server_name
  version             = "12.0"

  administrator_login          = var.sa_login
  administrator_login_password = random_password.db_sa.result

  azuread_administrator {
    tenant_id      = var.ad_admin.tenant_id
    object_id      = var.ad_admin.object_id
    login_username = var.ad_admin.display_name
  }

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_all" {
  count = var.firewall.allow_all ? 1 : 0

  server_id        = azurerm_mssql_server.main.id
  name             = "allow-all"
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_mssql_firewall_rule" "ip_rules" {
  for_each = var.firewall.ip_rules

  server_id        = azurerm_mssql_server.main.id
  name             = each.key
  start_ip_address = each.value.start_ip
  end_ip_address   = each.value.end_ip
}

resource "azurerm_mssql_virtual_network_rule" "subnet_rules" {
  for_each = var.firewall.subnet_rules

  server_id = azurerm_mssql_server.main.id
  name      = each.key
  subnet_id = each.value.subnet_id
}
