resource "kubernetes_config_map_v1" "config_map" {
  for_each = var.k8s_config_maps

  metadata {
    name      = each.key
    namespace = each.value.namespace
    labels    = each.value.labels
  }

  data = each.value.data
}

resource "kubernetes_secret_v1" "secrets" {
  for_each = var.k8s_secrets

  metadata {
    name      = each.key
    namespace = each.value.namespace
    labels    = each.value.labels
  }

  data = each.value.data
  type = "Opaque"
}
