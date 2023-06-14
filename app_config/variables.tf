variable "key_vault_id" {
  type = string
}

variable "key_vault_access_policy" {
  type = object({
    tenant_id = string
    object_id = string

    key_permissions         = optional(list(string))
    secret_permissions      = optional(list(string))
    certificate_permissions = optional(list(string))
  })
}

variable "key_vault_secrets" {
  type      = map(string)
  sensitive = true
}

variable "key_vault_deploy_policy_depends_on" {
  type        = any
  default     = null
  description = <<EOT
  To manage key vault secrets, acting user needs to have access to key vault. If the access policy is setup in within the same root module 
  pass `azurerm_key_vault_access_policy.<policy-name>` here to avoid race conditions.
  EOT
}

variable "k8s_namespace" {
  type = string
}

variable "k8s_config_maps" {
  description = "ConfigMaps to create for the application"

  type = map(object({
    labels = map(string)
    data   = map(string)
  }))
}

variable "k8s_secrets" {
  description = "Secrets to create for the application"

  type = map(object({
    labels = map(string)
    data   = map(string)
  }))
}
