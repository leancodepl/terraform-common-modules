variable "resource_group_name" {
  type = string
}

variable "service_bus_name" {
  type = string
}

variable "location" {
  type        = string
  default     = null
  description = "Defaults to the location of the resource group."
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "data_owners_object_ids" {
  type        = map(string)
  description = <<EOT
  Principals to grant 'Azure Service Bus Data Owner' role
  Map key can be anything, they're only used to give terraform resources a stable identity. Map value should be the object id of the principal.
  EOT
}

variable "tags" {
  type = map(string)
}
