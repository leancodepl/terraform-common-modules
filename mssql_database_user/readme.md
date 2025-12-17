<!-- BEGIN_TF_DOCS -->
# MSSQL user module
The module creates an SQL user mapped to an Azure AD Idenity.

**WARNING**: This module will raise an error on plan if the database does not exist yet. If you configure the database and user in the same project, make sure to partially apply database first.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_mssql"></a> [mssql](#requirement\_mssql) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mssql"></a> [mssql](#provider\_mssql) | ~> 0.6 |

## Resources

| Name | Type |
|------|------|
| [mssql_azuread_service_principal.user](https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs/resources/azuread_service_principal) | resource |
| [mssql_database_permission.permissions](https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs/resources/database_permission) | resource |
| [mssql_database_role_member.roles](https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs/resources/database_role_member) | resource |
| [mssql_database.database](https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs/data-sources/database) | data source |
| [mssql_database_role.roles](https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs/data-sources/database_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database"></a> [database](#input\_database) | n/a | <pre>object({<br/>    name = string<br/>    fqdn = string<br/>  })</pre> | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | n/a | `set(string)` | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | `set(string)` | n/a | yes |
| <a name="input_user"></a> [user](#input\_user) | n/a | <pre>object({<br/>    name      = string<br/>    client_id = string<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_user_id"></a> [db\_user\_id](#output\_db\_user\_id) | n/a |
| <a name="output_managed_identity_connection_string"></a> [managed\_identity\_connection\_string](#output\_managed\_identity\_connection\_string) | n/a |
<!-- END_TF_DOCS -->