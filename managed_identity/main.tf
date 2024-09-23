/**
 * # Managed Identity module
 * The module manages application identity:
 * - Azure Managed Identity and it's role assignments
 * - Kubernetes service account and Azure Workload Identity integration
 */

terraform {
  required_version = ">= 1.0.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3"
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
