variable "gcp_project_id" {
  type = string
}

variable "location" {
  type    = string
  default = null

  description = <<EOT
  WARNING: Cannot be changed once set
  EOT
}

variable "firebase_admins_emails" {
  type = set(string)
}
