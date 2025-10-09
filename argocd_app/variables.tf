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

variable "annotations" {
  type        = map(string)
  description = "Additional annotations for the ArgoCD application"
  default     = {}
}

variable "labels" {
  type        = map(string)
  description = "Additional labels for the ArgoCD application"
  default     = {}
}

variable "slack_notifications" {
  type = list(object({
    channel           = string
    notify_on_success = optional(bool, false)
  }))
  description = "List of Slack channels to send ArgoCD notifications to. Each entry specifies a channel and whether to notify on failures (false, default) or on all syncs (true)"
  default     = []
}
