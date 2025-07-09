/**
 * # Managed Identity module
 * The module manages application identity:
 * - Azure Managed Identity and it's role assignments
 * - Kubernetes service account and Azure Workload Identity integration
 *
 * ## Breaking changes
 * ### `azure_role_assignments` variable changed from list to map
 * 
 * Using list that created artificial key from resource_id / role name requires the resource to be created up front, forcing partial applies.
 * To mitigate it, now module requires the user to pass a map with a predefined key.
 * 
 * Before:
 * ```
 * module "managed_identity" {
 *     ...
 *     azure_role_assignments = [
 *         {
 *             name = "Storage Blob Data Contributor"
 *             scope = azurerm_storage_account.storage.id
 *         }
 *     ]
 * }
 * ```
 * 
 * After: 
 * ```
 * module "managed_identity" {
 *     ...
 *     azure_role_assignments = {
 *         "storage-contributor" = {
 *             name = "Storage Blob Data Contributor"
 *             scope = azurerm_storage_account.storage.id
 *         }
 *     }
 * }
 * ```
 * 
 * To migrate existing resources either let terraform destroy previous assignments or use `moved` block for each assignment:
 * ```
 * moved {
 *   from = module.managed_identity_api.azurerm_role_assignment.identity_roles["resource_id/Storage Blob Data Contributor"]
 *   to   = module.managed_identity_api.azurerm_role_assignment.identity_roles["storage-contributor"]
 * }
 * ```
 * */

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
