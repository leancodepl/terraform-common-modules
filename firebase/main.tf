terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.69"
    }
  }
}

resource "google_firebase_project" "project" {
  provider = google-beta
  project  = var.gcp_project_id
}

resource "google_firebase_project_location" "location" {
  count = var.location != null ? 1 : 0

  provider    = google-beta
  project     = var.gcp_project_id
  location_id = var.location
}


resource "google_project_iam_member" "firebase_admins" {
  for_each = var.firebase_admins_emails

  project = var.gcp_project_id
  role    = "roles/firebase.admin"
  member  = "user:${each.value}"
}

