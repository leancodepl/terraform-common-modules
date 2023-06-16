resource "kubernetes_deployment_v1" "deployment" {
  metadata {
    name      = "azure-workload-identity-demo"
    namespace = kubernetes_namespace_v1.main.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        "component" = "workload-identity-demo"
      }
    }

    template {
      metadata {
        labels = {
          "component"                   = "workload-identity-demo"
          "azure.workload.identity/use" = true
        }
      }

      spec {
        service_account_name = module.managed_identity.service_account.name

        container {
          name = "oidc"

          # https://learn.microsoft.com/en-us/azure/aks/learn/tutorial-kubernetes-workload-identity#deploy-the-workload
          image = "ghcr.io/azure/azure-workload-identity/msal-go"

          resources {
            requests = {
              cpu    = "50m"
              memory = "50Mi"
            }
            limits = {
              cpu    = "50m"
              memory = "50Mi"
            }
          }

          env {
            name  = "KEYVAULT_URL"
            value = module.key_vault.vault_url
          }
          env {
            name  = "SECRET_NAME"
            value = "test-secret"
          }
        }
      }
    }
  }
}
