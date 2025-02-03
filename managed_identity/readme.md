<!-- BEGIN_TF_DOCS -->
# Managed Identity module
The module manages application identity:
- Azure Managed Identity and it's role assignments
- Kubernetes service account and Azure Workload Identity integration

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.20 |

## Resources

| Name | Type |
|------|------|
| [azurerm_federated_identity_credential.identity_credential](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_role_assignment.identity_roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [kubernetes_service_account_v1.service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1) | resource |
| [azurerm_kubernetes_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_azure_role_assignments"></a> [azure\_role\_assignments](#input\_azure\_role\_assignments) | n/a | <pre>list(object({<br/>    role_name = string<br/>    scope     = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes"></a> [kubernetes](#input\_kubernetes) | n/a | <pre>object({<br/>    azure_resource_group    = string<br/>    kubernetes_service_name = string<br/>    namespace               = string<br/>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Defaults to the location of the resource group. | `string` | `null` | no |
| <a name="input_managed_identity_name"></a> [managed\_identity\_name](#input\_managed\_identity\_name) | n/a | `string` | n/a | yes |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to each resource. Will be used both as Azure tags and Kubernetes labels. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_identity"></a> [managed\_identity](#output\_managed\_identity) | n/a |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
<!-- END_TF_DOCS -->