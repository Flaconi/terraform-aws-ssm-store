# Terraform module: AWS SSM Store

[![Lint Status](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/linting.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/linting.yml)
[![Docs Status](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/terraform-docs.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-ssm-store/actions/workflows/terraform-docs.yml)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-ssm-store.svg)](https://github.com/flaconi/terraform-aws-ssm-store/releases)
[![Terraform](https://img.shields.io/badge/Terraform--registry-aws--ssm--store-brightgreen.svg)](https://registry.terraform.io/modules/Flaconi/ssm-store/aws/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This Terraform module can create an arbitrary number of SSM-keys to store parameters.

## Usage

### Assumeable roles

```hcl
module "ssm" {
  source = "github.com/flaconi/terraform-aws-ssm-store?ref=v1.2.0"

  tags =  {
   "Created by" = "terraform"
  }

  kms_alias =  "alias/aws/ssm"

  name_prefix = "/applications/app1"
  parameters = [
    {
      name  = "secure"
      value = "securevalue"
    },
    {
      name  = "secure2"
      value = "securevalue2"
      type  = "SecureString" # Set explicitly
    },
    {
      name  = "insecure"
      value = "insecurevalue"
      type  = "String"
    },
  ]
}
```

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags applied to the resources

Type: `map(string)`

Default: `{}`

### <a name="input_kms_alias"></a> [kms\_alias](#input\_kms\_alias)

Description: kms\_alias sets the kms alias used for SecureString

Type: `string`

Default: `"alias/aws/ssm"`

### <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix)

Description: name\_prefix prefixes the given name with a prefix

Type: `string`

Default: `""`

### <a name="input_parameters"></a> [parameters](#input\_parameters)

Description: A list of dicts with parameter information

Type:

```hcl
list(object({
    name  = string
    type  = optional(string, "SecureString") # String, StringList or SecureString
    value = string
  }))
```

Default: `[]`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_arns"></a> [parameter\_arns](#output\_parameter\_arns) | Map of parameter name and arn |

<!-- TFDOCS_OUTPUTS_END -->

## License

[MIT License](LICENSE)

Copyright (c) 2024 **[Flaconi GmbH](https://github.com/flaconi)**
