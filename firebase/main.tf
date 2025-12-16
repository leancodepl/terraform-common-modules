terraform {
  required_version = ">= 1.14.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.13"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 7.13"
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

