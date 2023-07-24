variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "blob_retention_policy" {
  type    = number
  default = null
}

variable "container_retention_policy" {
  type    = number
  default = null
}

variable "blob_cors_rules" {
  type = list(object({
    allowed_origins    = list(string)
    allowed_methods    = optional(list(string), ["GET", "PUT", "DELETE"])
    allowed_headers    = optional(list(string), ["*"])
    exposed_headers    = optional(list(string), ["*"])
    max_age_in_seconds = optional(number, 3600)
  }))
}

variable "blob_containers" {
  type = map(object({
    access_type = string
  }))

  default = {}
}

variable "data_owners_object_ids" {
  type        = map(string)
  description = <<EOT
  Principals to grant 'Storage Blob Data Owner' role.
  Map key can be anything, they're only used to give terraform resources a stable identity. Map value should be the object id of the principal.
  EOT
}

variable "tags" {
  type = map(string)
}
