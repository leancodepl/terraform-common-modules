/**
 * # Application config module
 * The module manages application configuration:
 * - Azure Key Vault Secrets along with app access configuration
 * - Kubernets Config Maps and Secrets 
 */

terraform {
  required_version = ">= 1.14.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.56"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }
  }
}
