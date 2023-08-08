<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.69 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.69 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.76.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.76.0 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_firebase_project.project](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_project) | resource |
| [google-beta_google_firebase_project_location.location](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_project_location) | resource |
| [google_project_iam_member.firebase_admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firebase_admins_emails"></a> [firebase\_admins\_emails](#input\_firebase\_admins\_emails) | n/a | `set(string)` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | WARNING: Cannot be changed once set | `string` | `null` | no |
<!-- END_TF_DOCS -->