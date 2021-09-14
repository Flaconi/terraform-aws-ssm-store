# Terraform module: AWS SSM Store

[![Lint Status](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/linting.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/linting.yml)
[![Docs Status](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/terraform-docs.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/terraform-docs.yml)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-ssm-store.svg)](https://github.com/flaconi/terraform-aws-ssm-store/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This Terraform module can create an arbitrary number of SSM-keys to store parameters.

## Usage

### Assumeable roles

```hcl
module "iam_roles" {
  source = "github.com/flaconi/terraform-aws-ssm-store?ref=v0.0.1"

  tags =  {
   "Created by" = "terraform"
  }

  kms_alias =  "alias/aws/ssm"

  name_prefix = "/applications/app1"
  # overwrite = true
  parameters = [
  {
    name      = "secure"
    value     = "securevalue"
    type      = "SecureString"
    overwrite = true
  },
  {
    name      = "secure2"
    value     = "securevalue2"
    type      = "SecureString"
    overwrite = true
  },
  {
    name      = "insecure"
    value     = "insecurevalue"
    type      = "String"
    overwrite = true
  },
]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| kms\_alias | kms\_alias sets the kms alias used for SecureString | `string` | `"alias/aws/ssm"` | no |
| name\_prefix | name\_prefix prefixes the given name with a prefix | `string` | `""` | no |
| overwrite | overwrite defines if we overwrite existing params | `bool` | `true` | no |
| parameters | A list of dicts with parameter information | <pre>list(object({<br>    name  = string # Name of the policy<br>    type  = string # Defaults to 'var.policy_path' variable if empty<br>    value = string # Defaults to 'var.policy_desc' variable if empty<br>  }))</pre> | `[]` | no |
| tags | Tags applied to the resources | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

[MIT License](LICENSE)
