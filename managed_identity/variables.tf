variable "managed_identity_name" {
  type = string
}

variable "service_account_name" {
  type    = string
  default = null
}

variable "azure_resource_group" {
  type = string
}

variable "azure_role_assignments" {
  type = list(object({
    role_name = string
    scope     = string
  }))
}

variable "kubernetes" {
  type = object({
    azure_resource_group    = string
    kubernetes_service_name = string
    namespace               = string
  })
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to each resource. Will be used both as Azure tags and Kubernetes labels."
}
