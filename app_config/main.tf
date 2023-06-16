/**
 * # Application config module
 * The module manages application configuration:
 * - Azure Key Vault Secrets along with app access configuration
 * - Kubernets Config Maps and Secrets 
 */

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
