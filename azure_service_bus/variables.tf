variable "resource_group_name" {
  type = string
}

variable "service_bus_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "data_owners_object_ids" {
  type        = set(string)
  description = "Principals to grant 'Azure Service Bus Data Owner' role"
}

variable "tags" {
  type = map(string)
}
