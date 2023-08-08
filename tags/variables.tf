variable "name" {
  type        = string
  description = "The name of the project."
  nullable    = false

  validation {
    condition     = length(var.name) > 0
    error_message = "The name variable must not be empty."

  }
}

variable "environment" {
  type        = string
  description = "The environment name."
  nullable    = false

  validation {
    condition     = can(regex("dev|test|production|internal", var.environment))
    error_message = "The environment variable must be one of: dev, test, production, internal"
  }
}

variable "deployed_on" {
  type        = string
  description = "The cluster the application is deployed on. Use `self` if this is not cluster-deployed application or the cluster is part of the project. If this is deployed on a custom cluster, use `dedicated_cluster` variable instead."
  default     = null
  nullable    = true

  validation {
    condition     = var.deployed_on == null || can(regex("self|internal-apps|test-apps|production-apps|production-apps-eastus", var.deployed_on))
    error_message = "The deployed_on variable must be set to one of: self, internal-apps, test-apps, production-apps, production-apps-eastus"
  }
}

variable "dedicated_cluster" {
  type        = string
  description = "The name of the dedicated cluster that the project is deployed on."
  default     = null
  nullable    = true

  validation {
    condition     = var.dedicated_cluster == null || try(length(var.dedicated_cluster), 0) > 0
    error_message = "The dedicated_cluster variable, when set, must be not empty."
  }
}

variable "type" {
  type        = string
  description = "The type of the deployment. Most commonly `project`."
  default     = "project"
  nullable    = false

  validation {
    condition     = can(regex("project|cluster|internal", var.type))
    error_message = "The type variable must be one of: project, cluster, internal"
  }
}

variable "custom_tags" {
  type        = map(string)
  description = "The custom tags that will be applied."
  default     = {}
  nullable    = false
}
