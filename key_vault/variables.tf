variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "owner_access_policy" {
  type = object({
    tenant_id = string
    object_id = string
  })
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
