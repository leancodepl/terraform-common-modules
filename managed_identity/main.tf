terraform {
  required_version = ">= 1.0.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.58"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
}

data "azurerm_resource_group" "main" {
  name = var.azure_resource_group
}

data "azurerm_kubernetes_cluster" "cluster" {
  name                = var.kubernetes.kubernetes_service_name
  resource_group_name = var.kubernetes.azure_resource_group
}
