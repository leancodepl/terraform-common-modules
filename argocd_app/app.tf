resource "argocd_application" "app" {
  metadata {
    name        = var.app_name
    namespace   = var.argocd_namespace
    annotations = var.annotations
  }

  spec {
    project = var.project_name

    source {
      repo_url        = var.repository.url
      target_revision = var.repository.revision
      path            = var.repository.path

      directory {
        recurse = var.directory_recurse
      }
    }

    destination {
      server    = var.cluster.url
      namespace = var.cluster.namespace
    }

    sync_policy {
      dynamic "automated" {
        for_each = var.enable_auto_sync ? [""] : []

        content {
          prune       = false
          self_heal   = false
          allow_empty = false
        }
      }
    }

    revision_history_limit = 3
  }
}
