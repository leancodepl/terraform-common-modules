terraform {
  required_version = ">= 1.0.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.58"
    }
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storage" {
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  name                = var.storage_account_name

  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  access_tier              = var.access_tier

  allow_nested_items_to_be_public = true
  enable_https_traffic_only       = true

  tags = var.tags

  blob_properties {
    dynamic "cors_rule" {
      for_each = var.blob_cors_rules
      content {
        allowed_headers    = each.value.allowed_headers
        allowed_methods    = each.value.allowed_methods
        allowed_origins    = each.value.allowed_origins
        exposed_headers    = each.value.exposed_headers
        max_age_in_seconds = each.value.max_age_in_seconds
      }
    }

    dynamic "container_delete_retention_policy" {
      for_each = var.container_retention_policy != null ? [var.container_retention_policy] : []
      content {
        days = var.container_retention_policy
      }
    }

    dynamic "delete_retention_policy" {
      for_each = var.blob_retention_policy != null ? [var.blob_retention_policy] : []
      content {
        days = var.blob_retention_policy
      }
    }
  }
}

resource "azurerm_storage_container" "containers" {
  for_each = var.blob_containers

  storage_account_name = azurerm_storage_account.storage.name

  name                  = each.key
  container_access_type = each.value.access_type
}

resource "azurerm_role_assignment" "data_owners" {
  for_each = var.data_owners_object_ids

  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = each.key
}


