locals {
  all_failure_channels = [for n in var.slack_notifications : n.channel]
  all_sync_channels    = [for n in var.slack_notifications : n.channel if n.notify_on_success]

  slack_annotations = merge(
    length(local.all_failure_channels) > 0 ? {
      "notifications.argoproj.io/subscribe.on-sync-failed.slack" = join(";", local.all_failure_channels)
    } : {},
    length(local.all_sync_channels) > 0 ? {
      "notifications.argoproj.io/subscribe.on-sync-succeeded.slack" = join(";", local.all_sync_channels)
    } : {}
  )

  all_annotations = merge(var.annotations, local.slack_annotations)
}

resource "argocd_application" "app" {
  metadata {
    name        = var.app_name
    namespace   = var.argocd_namespace
    annotations = local.all_annotations
    labels      = var.labels
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
