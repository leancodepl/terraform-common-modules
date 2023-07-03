variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "server" {
  type = object({
    name                = string
    version             = string
    sku_name            = string
    storage_mb          = number
    administrator_login = string
  })
}

variable "ad_admin" {
  type = object({
    tenant_id      = string
    object_id      = string
    principal_name = string
    principal_type = optional(string, "Group")
  })
}

variable "databases" {
  type = map(object({
    charset   = string
    collation = string

    roles = map(object({
      roles      = optional(set(string), [])
      privileges = set(string)
    }))

    ad_roles = optional(object({
      app_role        = string
      migrations_role = string
    }))
  }))
}

variable "firewall" {
  type = object({
    allow_all = bool

    ip_rules = map(object({
      start_ip = string
      end_ip   = string
    }))
  })
}

variable "maintenance_window" {
  type = object({
    start_hour   = optional(number, 3)
    day_of_week  = optional(number, null)
    start_minute = optional(number, null)
  })

  default = {}
}

variable "tags" {
  type = map(string)
}
