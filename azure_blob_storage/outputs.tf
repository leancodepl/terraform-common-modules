output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

output "storage_connection_string" {
  value = azurerm_storage_account.storage.primary_blob_connection_string
}

output "storage_containers" {
  value = azurerm_storage_container.containers
}
