terraform {
  required_version = ">= 1.0.2"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.39"
    }
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

provider "azurerm" {
  tenant_id       = var.azure.tenant_id
  subscription_id = var.azure.subscription_id

  features {}
}

provider "kubernetes" {
  config_path    = var.kubernetes.config_path
  config_context = var.kubernetes.config_context
}

data "azuread_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = "terraform-common-modules-example"
  location = "West Europe"
}

resource "kubernetes_namespace_v1" "main" {
  metadata {
    name = "terraform-common-modules-example"
  }
}
