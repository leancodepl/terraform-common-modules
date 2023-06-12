# Application config module
The module manages application configuration:
- Azure Key Vault Secrets along with app access configuration
- Kubernets Config Maps and Secrets

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.58 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.59.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.key_vault_app_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.secrets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [kubernetes_config_map_v1.config_map](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1) | resource |
| [kubernetes_secret_v1.secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_config_maps"></a> [k8s\_config\_maps](#input\_k8s\_config\_maps) | ConfigMaps to create for the application | <pre>map(object({<br>    namespace = string<br>    labels    = map(string)<br><br>    data = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_k8s_secrets"></a> [k8s\_secrets](#input\_k8s\_secrets) | Secrets to create for the application | <pre>map(object({<br>    namespace = string<br>    labels    = map(string)<br><br>    data = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | n/a | <pre>object({<br>    id            = string<br>    app_object_id = string<br>    tenant_id     = string<br><br>    secrets = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_key_vault_access_policy"></a> [key\_vault\_access\_policy](#input\_key\_vault\_access\_policy) | n/a | <pre>object({<br>    tenant_id = string<br>    object_id = string<br><br>    key_permissions         = optional(list(string))<br>    secret_permissions      = optional(list(string))<br>    certificate_permissions = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_key_vault_deploy_policy_depends_on"></a> [key\_vault\_deploy\_policy\_depends\_on](#input\_key\_vault\_deploy\_policy\_depends\_on) | To manage key vault secrets, acting user needs to have access to key vault. If the access policy is setup in within the same root module <br>  pass `azurerm_key_vault_access_policy.<policy-name>` here to avoid race conditions. | `any` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_secrets"></a> [key\_vault\_secrets](#input\_key\_vault\_secrets) | n/a | `map(string)` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
# Application config module
The module manages application configuration:
- Azure Key Vault Secrets along with app access configuration
- Kubernets Config Maps and Secrets

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.58 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.58 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.20 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.key_vault_app_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.secrets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [kubernetes_config_map_v1.config_map](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1) | resource |
| [kubernetes_secret_v1.secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_config_maps"></a> [k8s\_config\_maps](#input\_k8s\_config\_maps) | ConfigMaps to create for the application | <pre>map(object({<br>    namespace = string<br>    labels    = map(string)<br><br>    data = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_k8s_secrets"></a> [k8s\_secrets](#input\_k8s\_secrets) | Secrets to create for the application | <pre>map(object({<br>    namespace = string<br>    labels    = map(string)<br><br>    data = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_key_vault_access_policy"></a> [key\_vault\_access\_policy](#input\_key\_vault\_access\_policy) | n/a | <pre>object({<br>    tenant_id = string<br>    object_id = string<br><br>    key_permissions         = optional(list(string))<br>    secret_permissions      = optional(list(string))<br>    certificate_permissions = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_key_vault_deploy_policy_depends_on"></a> [key\_vault\_deploy\_policy\_depends\_on](#input\_key\_vault\_deploy\_policy\_depends\_on) | To manage key vault secrets, acting user needs to have access to key vault. If the access policy is setup in within the same root module <br>  pass `azurerm_key_vault_access_policy.<policy-name>` here to avoid race conditions. | `any` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_secrets"></a> [key\_vault\_secrets](#input\_key\_vault\_secrets) | n/a | `map(string)` | n/a | yes |
<!-- END_TF_DOCS -->