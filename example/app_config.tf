module "app_config" {
  source = "../app_config"

  key_vault_id                       = module.key_vault.vault_id
  key_vault_deploy_policy_depends_on = module.key_vault.deploy_policy
  key_vault_access_policy = {
    tenant_id = var.azure.tenant_id
    object_id = module.managed_identity.managed_identity.object_id
  }

  key_vault_secrets = {
    "test-secret" = "secret"
  }

  k8s_namespace   = kubernetes_namespace_v1.main.metadata[0].name
  k8s_config_maps = {}
  k8s_secrets     = {}
}
