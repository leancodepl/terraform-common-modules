/**
 * # Key Vault module
 * The module creates Azure Key Vault along with deployment access policy.
 */

terraform {
  required_version = ">= 1.14.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.7"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.56"
    }
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
