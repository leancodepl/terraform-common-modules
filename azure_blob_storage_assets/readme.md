<!-- BEGIN_TF_DOCS -->
# Azure Blob Storage assets module
Upload directory contents to a Blob Storage container

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asset_files"></a> [asset\_files](#module\_asset\_files) | hashicorp/dir/template | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_blob.assets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_dir"></a> [base\_dir](#input\_base\_dir) | n/a | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assets"></a> [assets](#output\_assets) | n/a |
<!-- END_TF_DOCS -->