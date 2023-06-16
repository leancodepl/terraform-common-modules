variable "azure" {
  type = object({
    tenant_id       = string
    subscription_id = string

    aks_resource_group_name = string
    aks_name                = string
  })
}

variable "kubernetes" {
  type = object({
    config_path    = string
    config_context = string
  })
}
