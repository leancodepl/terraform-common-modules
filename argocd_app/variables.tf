variable "repository" {
  type = object({
    url      = string,
    revision = string,
    path     = string,
  })
}

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "enable_auto_sync" {
  type = bool
}

variable "project_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "cluster" {
  type = object({
    url       = string
    namespace = string
  })
}

variable "directory_recurse" {
  type    = bool
  default = false
}
