<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | ~> 1.17 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.3 |
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | ~> 1.17 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.5 |

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_active_directory_administrator.admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_active_directory_administrator) | resource |
| [azurerm_postgresql_flexible_server_database.databases](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.allow_all](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [postgresql_grant.database_grants](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs/resources/grant) | resource |
| [postgresql_role.roles](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs/resources/role) | resource |
| [random_password.db_admin](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.roles](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_admin"></a> [ad\_admin](#input\_ad\_admin) | n/a | <pre>object({<br/>    tenant_id      = string<br/>    object_id      = string<br/>    principal_name = string<br/>    principal_type = optional(string, "Group")<br/>  })</pre> | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | n/a | <pre>map(object({<br/>    charset   = string<br/>    collation = string<br/><br/>    roles = map(object({<br/>      roles      = optional(set(string), [])<br/>      privileges = set(string)<br/>    }))<br/><br/>    ad_roles = optional(object({<br/>      app_role        = string<br/>      migrations_role = string<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_firewall"></a> [firewall](#input\_firewall) | n/a | <pre>object({<br/>    allow_all = bool<br/><br/>    ip_rules = map(object({<br/>      start_ip = string<br/>      end_ip   = string<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | <pre>object({<br/>    start_hour   = optional(number, 3)<br/>    day_of_week  = optional(number, null)<br/>    start_minute = optional(number, null)<br/>  })</pre> | `{}` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | <pre>object({<br/>    name     = string<br/>    location = string<br/>  })</pre> | n/a | yes |
| <a name="input_server"></a> [server](#input\_server) | n/a | <pre>object({<br/>    name                = string<br/>    version             = string<br/>    sku_name            = string<br/>    storage_mb          = number<br/>    administrator_login = string<br/>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ad_roles"></a> [ad\_roles](#output\_ad\_roles) | n/a |
| <a name="output_ad_setup_config"></a> [ad\_setup\_config](#output\_ad\_setup\_config) | n/a |
| <a name="output_ad_setup_script"></a> [ad\_setup\_script](#output\_ad\_setup\_script) | n/a |
| <a name="output_administrator_login"></a> [administrator\_login](#output\_administrator\_login) | n/a |
| <a name="output_administrator_password"></a> [administrator\_password](#output\_administrator\_password) | n/a |
| <a name="output_postresql_server_id"></a> [postresql\_server\_id](#output\_postresql\_server\_id) | n/a |
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | n/a |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | n/a |
<!-- END_TF_DOCS -->

## Active Directory roles setup

Postgres provider cannot create AD roles (it cannot login via AD). Instead a setup script is generated. Two outputs are defined

- `ad_setup_script` - contents of [provision_psql.sh](./provision_psql.sh)
- `ad_setup_config` - setup SQL script and credentials to the server

To use the script you need to output them in the root module.

```terraform
module "postgresql" {
  source = "../postgresql"
  // clipped
}

output "postgres_ad_roles_config" {
  value     = module.postgresql.ad_setup_config
  sensitive = true
}

// Script assumes this output name by default
output "postgres_ad_roles_script" {
  value     = module.postgresql.ad_setup_script
  sensitive = false
}
```

You can setup roles via a one-liner `tf output -raw postgres_ad_roles_script | bash` or export the script to a file.
You need to have `psql` CLI installed to run the script.
