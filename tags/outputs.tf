locals {
  tags = {
    "project"     = var.name
    "type"        = var.type
    "environment" = var.environment
    "deployed-on" = var.dedicated_cluster != null ? var.dedicated_cluster : var.deployed_on
    "importance"  = var.environment == "dev" ? "low" : (var.type == "cluster" || var.type == "internal" ? "critical" : "high")
  }
}

output "tags" {
  description = "The common tags that should be applied to all resources."
  value       = merge(var.custom_tags, local.tags)

  precondition {
    condition     = (var.deployed_on == null) != (var.dedicated_cluster != null)
    error_message = "You must specify either `deployed_on` or `dedicated_cluster` variable, not both."
  }
}
