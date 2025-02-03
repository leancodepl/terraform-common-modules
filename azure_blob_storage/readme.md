<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.16.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.data_owners](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.containers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | n/a | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | n/a | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_blob_containers"></a> [blob\_containers](#input\_blob\_containers) | n/a | <pre>map(object({<br/>    access_type = string<br/>  }))</pre> | `{}` | no |
| <a name="input_blob_cors_rules"></a> [blob\_cors\_rules](#input\_blob\_cors\_rules) | n/a | <pre>list(object({<br/>    allowed_origins    = list(string)<br/>    allowed_methods    = optional(list(string), ["GET", "PUT", "DELETE"])<br/>    allowed_headers    = optional(list(string), ["*"])<br/>    exposed_headers    = optional(list(string), ["*"])<br/>    max_age_in_seconds = optional(number, 3600)<br/>  }))</pre> | n/a | yes |
| <a name="input_blob_retention_policy"></a> [blob\_retention\_policy](#input\_blob\_retention\_policy) | n/a | `number` | `null` | no |
| <a name="input_container_retention_policy"></a> [container\_retention\_policy](#input\_container\_retention\_policy) | n/a | `number` | `null` | no |
| <a name="input_data_owners_object_ids"></a> [data\_owners\_object\_ids](#input\_data\_owners\_object\_ids) | Principals to grant 'Storage Blob Data Owner' role.<br/>  Map key can be anything, they're only used to give terraform resources a stable identity. Map value should be the object id of the principal. | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Defaults to the location of the resource group. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_blob_endpoint"></a> [storage\_blob\_endpoint](#output\_storage\_blob\_endpoint) | n/a |
| <a name="output_storage_connection_string"></a> [storage\_connection\_string](#output\_storage\_connection\_string) | n/a |
| <a name="output_storage_containers"></a> [storage\_containers](#output\_storage\_containers) | n/a |
<!-- END_TF_DOCS -->