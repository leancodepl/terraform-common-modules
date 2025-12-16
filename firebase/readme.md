<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.13 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 7.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 7.13 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 7.13 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_firebase_project.project](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_project) | resource |
| [google_project_iam_member.firebase_admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firebase_admins_emails"></a> [firebase\_admins\_emails](#input\_firebase\_admins\_emails) | n/a | `set(string)` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->