module "blobstorage" {
  source = "../azure_blob_storage"

  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = "tfcommonmodules"

  data_owners_object_ids = [module.managed_identity.managed_identity.object_id]

  blob_containers = {
    "public" = {
      access_type = "blob"
    }
  }

  blob_cors_rules = []
  tags            = {}
}

module "storage_assets" {
  source = "../azure_blob_storage_assets"

  storage_account_name = module.blobstorage.storage_account_name
  container_name       = module.blobstorage.storage_containers["public"].name

  base_dir = "./storage-assets"
}
