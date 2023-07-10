<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.39 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.58 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.20 |
| <a name="requirement_mssql"></a> [mssql](#requirement\_mssql) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.39.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.21.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_config"></a> [app\_config](#module\_app\_config) | ../app_config | n/a |
| <a name="module_blobstorage"></a> [blobstorage](#module\_blobstorage) | ../azure_blob_storage | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../key_vault | n/a |
| <a name="module_managed_identity"></a> [managed\_identity](#module\_managed\_identity) | ../managed_identity | n/a |
| <a name="module_migrations"></a> [migrations](#module\_migrations) | ../managed_identity | n/a |
| <a name="module_mssql_server"></a> [mssql\_server](#module\_mssql\_server) | ../mssql_server | n/a |
| <a name="module_mssql_user"></a> [mssql\_user](#module\_mssql\_user) | ../mssql_database_user | n/a |
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | ../postgresql | n/a |
| <a name="module_service_bus"></a> [service\_bus](#module\_service\_bus) | ../azure_service_bus | n/a |
| <a name="module_storage_assets"></a> [storage\_assets](#module\_storage\_assets) | ../azure_blob_storage_assets | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [kubernetes_deployment_v1.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment_v1) | resource |
| [kubernetes_namespace_v1.main](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure"></a> [azure](#input\_azure) | n/a | <pre>object({<br>    tenant_id       = string<br>    subscription_id = string<br><br>    aks_resource_group_name = string<br>    aks_name                = string<br>  })</pre> | n/a | yes |
| <a name="input_kubernetes"></a> [kubernetes](#input\_kubernetes) | n/a | <pre>object({<br>    config_path    = string<br>    config_context = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgres_ad_roles_config"></a> [postgres\_ad\_roles\_config](#output\_postgres\_ad\_roles\_config) | n/a |
| <a name="output_postgres_ad_roles_script"></a> [postgres\_ad\_roles\_script](#output\_postgres\_ad\_roles\_script) | n/a |
<!-- END_TF_DOCS -->