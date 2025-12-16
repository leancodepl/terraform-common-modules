/**
 * # Azure Blob Storage assets module
 * Upload directory contents to a Blob Storage container 
 */

terraform {
  required_version = ">= 1.14.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3"
    }
  }
}

module "asset_files" {
  source  = "hashicorp/dir/template"
  version = "~> 1.0"

  base_dir = var.base_dir
}

resource "azurerm_storage_blob" "assets" {
  for_each = module.asset_files.files

  storage_account_name   = var.storage_account_name
  storage_container_name = var.container_name

  type = "Block"

  name         = each.key
  source       = each.value.source_path
  content_md5  = each.value.digests.md5
  content_type = each.value.content_type
}


