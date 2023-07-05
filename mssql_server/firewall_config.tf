resource "azurerm_mssql_firewall_rule" "allow_all" {
  count = var.firewall.allow_all ? 1 : 0

  server_id        = azurerm_mssql_server.main.id
  name             = "allow-all"
  start_ip_address = "0.0.0.0" #tfsec:ignore:azure-database-no-public-firewall-access
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
