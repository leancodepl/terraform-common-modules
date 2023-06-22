module "service_bus" {
  source = "../azure_service_bus"

  resource_group_name = azurerm_resource_group.main.name
  service_bus_name    = "common-modules-sbus"

  data_owners_object_ids = [module.managed_identity.managed_identity.object_id]

  tags = local.tags
}
