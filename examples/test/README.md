# Example
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| kms\_alias | kms_alias sets the kms alias used for SecureString | string | `"alias/aws/ssm"` | no |
| name\_prefix | name_prefix prefixes the given name with a prefix | string | `""` | no |
| overwrite | overwrite defines if we overwrite existing params | bool | `"true"` | no |
| parameters | A list of dicts with parameter information | object | `[]` | no |
| tags |  | map | `{}` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
