resource "azurerm_mssql_database" "databases" {
  for_each = var.databases

  server_id = azurerm_mssql_server.main.id

  name      = each.key
  sku_name  = each.value.sku
  collation = each.value.collation

  tags = var.tags
}
