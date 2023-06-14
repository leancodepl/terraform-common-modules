output "service_bus_id" {
  value = azurerm_servicebus_namespace.service_bus.id
}

output "service_bus_endpoint" {
  value       = "sb://${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net/"
  description = "Service Bus Endpoint with sb:// schema"
}

output "service_bus_connection_string" {
  value = azurerm_servicebus_namespace.service_bus.default_primary_connection_string
}
