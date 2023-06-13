variable "resource_group_name" {
  type = string
}

variable "server_name" {
  type = string
}

variable "sa_login" {
  type    = string
  default = null
}

variable "ad_admin" {
  type = object({
    tenant_id    = string
    object_id    = string
    display_name = string
  })
}

variable "firewall" {
  type = object({
    allow_all = bool
    ip_rules = map(object({
      start_ip = string
      end_ip   = string
    }))
    subnet_rules = map(object({
      subnet_id = string
    }))
  })
}

variable "tags" {
  type = map(string)
}
