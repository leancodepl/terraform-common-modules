variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type        = string
  default     = null
  description = "Defaults to the location of the resource group."
}

variable "owner_access_policy" {
  type = object({
    tenant_id = string
    object_id = string

    key_permissions         = optional(list(string))
    secret_permissions      = optional(list(string))
    certificate_permissions = optional(list(string))
  })
}

variable "soft_delete_retention_days" {
  type    = number
  default = 14
}

variable "tags" {
  type = map(string)
}

variable "network_acls" {
  type = object({
    allow_all  = bool
    subnet_ids = list(string)
    ip_ranges  = list(string)
  })
}
