terraform {
  required_version = ">= 1.14.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.7"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
