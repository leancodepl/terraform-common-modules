<!-- BEGIN_TF_DOCS -->
The module is responsible for standardizing the tags that should be applied to all project
resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | The custom tags that will be applied. | `map(string)` | n/a | yes |
| <a name="input_dedicated_cluster"></a> [dedicated\_cluster](#input\_dedicated\_cluster) | The name of the dedicated cluster that the project is deployed on. | `string` | `null` | no |
| <a name="input_deployed_on"></a> [deployed\_on](#input\_deployed\_on) | The cluster the application is deployed on. Use `self` if this is not cluster-deployed application or the cluster is part of the project. If this is deployed on a custom cluster, use `dedicated_cluster` variable instead. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the project. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of the deployment. Most commonly `project`. | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | The common tags that should be applied to all resources. |
<!-- END_TF_DOCS -->