<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.56 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.56 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.7 |

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.databases](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_firewall_rule.allow_all](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_firewall_rule.ip_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_virtual_network_rule.subnet_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_network_rule) | resource |
| [random_password.db_sa](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_admin"></a> [ad\_admin](#input\_ad\_admin) | n/a | <pre>object({<br/>    tenant_id    = string<br/>    object_id    = string<br/>    display_name = string<br/>  })</pre> | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | n/a | <pre>map(object({<br/>    sku                  = string<br/>    collation            = string<br/>    storage_account_type = optional(string, "Geo")<br/>  }))</pre> | n/a | yes |
| <a name="input_firewall"></a> [firewall](#input\_firewall) | n/a | <pre>object({<br/>    allow_all = bool<br/>    ip_rules = map(object({<br/>      start_ip = string<br/>      end_ip   = string<br/>    }))<br/>    subnet_rules = map(object({<br/>      subnet_id = string<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Defaults to the location of the resource group. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_sa_login"></a> [sa\_login](#input\_sa\_login) | n/a | `string` | `null` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_databases"></a> [mssql\_databases](#output\_mssql\_databases) | n/a |
| <a name="output_mssql_server_fqnd"></a> [mssql\_server\_fqnd](#output\_mssql\_server\_fqnd) | n/a |
| <a name="output_mssql_server_id"></a> [mssql\_server\_id](#output\_mssql\_server\_id) | n/a |
<!-- END_TF_DOCS -->