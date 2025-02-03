<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.3 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.data_owners](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_namespace.service_bus](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_owners_object_ids"></a> [data\_owners\_object\_ids](#input\_data\_owners\_object\_ids) | Principals to grant 'Azure Service Bus Data Owner' role<br/>  Map key can be anything, they're only used to give terraform resources a stable identity. Map value should be the object id of the principal. | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Defaults to the location of the resource group. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_service_bus_name"></a> [service\_bus\_name](#input\_service\_bus\_name) | n/a | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_bus_connection_string"></a> [service\_bus\_connection\_string](#output\_service\_bus\_connection\_string) | n/a |
| <a name="output_service_bus_endpoint"></a> [service\_bus\_endpoint](#output\_service\_bus\_endpoint) | Service Bus Endpoint with sb:// schema |
| <a name="output_service_bus_id"></a> [service\_bus\_id](#output\_service\_bus\_id) | n/a |
<!-- END_TF_DOCS -->