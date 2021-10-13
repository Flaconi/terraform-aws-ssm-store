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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_alias"></a> [kms\_alias](#input\_kms\_alias) | kms\_alias sets the kms alias used for SecureString | `string` | `"alias/aws/ssm"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | name\_prefix prefixes the given name with a prefix | `string` | `""` | no |
| <a name="input_overwrite"></a> [overwrite](#input\_overwrite) | overwrite defines if we overwrite existing params | `bool` | `true` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of dicts with parameter information | <pre>list(object({<br>    name  = string # Name of the policy<br>    type  = string # Defaults to 'var.policy_path' variable if empty<br>    value = string # Defaults to 'var.policy_desc' variable if empty<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the resources | `map(string)` | `{}` | no |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

[MIT License](LICENSE)
