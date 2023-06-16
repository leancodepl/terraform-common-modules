output "vault_id" {
  value = azurerm_key_vault.main.id
}

output "vault_url" {
  value = azurerm_key_vault.main.vault_uri
}

output "deploy_policy" {
  value       = azurerm_key_vault_access_policy.owner_access_to_main_keyvault
  description = "Pass this to `depends_on` of the resources that need key vault access policy"
}
