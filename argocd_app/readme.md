<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | ~> 7.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | 7.3.0 |

## Resources

| Name | Type |
|------|------|
| [argocd_application.app](https://registry.terraform.io/providers/argoproj-labs/argocd/latest/docs/resources/application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additional annotations for the ArgoCD application | `map(string)` | `{}` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | n/a | `string` | `"argocd"` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | <pre>object({<br/>    url       = string<br/>    namespace = string<br/>  })</pre> | n/a | yes |
| <a name="input_directory_recurse"></a> [directory\_recurse](#input\_directory\_recurse) | n/a | `bool` | `false` | no |
| <a name="input_enable_auto_sync"></a> [enable\_auto\_sync](#input\_enable\_auto\_sync) | n/a | `bool` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Additional labels for the ArgoCD application | `map(string)` | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | n/a | <pre>object({<br/>    url      = string,<br/>    revision = string,<br/>    path     = string,<br/>  })</pre> | n/a | yes |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | List of Slack channels to send ArgoCD notifications to. Each entry specifies a channel and whether to notify on failures (false, default) or on all syncs (true) | <pre>list(object({<br/>    channel            = string<br/>    notify_on_success  = optional(bool, false)<br/>  }))</pre> | `[]` | no |
<!-- END_TF_DOCS -->