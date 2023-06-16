variable "database" {
  type = object({
    name = string
    fqdn = string
  })
}

variable "user" {
  type = object({
    name      = string
    client_id = string
  })
}

variable "roles" {
  type = set(string)
}
