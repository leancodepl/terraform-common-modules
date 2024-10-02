terraform {
  required_version = ">= 1.0.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3"
    }
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_servicebus_namespace" "service_bus" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  name = var.service_bus_name
  sku  = var.sku

  tags = var.tags
}

resource "azurerm_role_assignment" "data_owners" {
  for_each = var.data_owners_object_ids

  scope                = azurerm_servicebus_namespace.service_bus.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = each.value
}
