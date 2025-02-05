terraform {
  required_version = ">= 1.0.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.5"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.5"
    }
  }
}

resource "google_firebase_project" "project" {
  provider = google-beta
  project  = var.gcp_project_id
}

resource "google_project_iam_member" "firebase_admins" {
  for_each = var.firebase_admins_emails

  project = var.gcp_project_id
  role    = "roles/firebase.admin"
  member  = "user:${each.value}"
}

