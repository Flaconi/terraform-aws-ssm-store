module "iam_roles" {
  source = "../../"

  tags = {
    "Created by" = "terraform"
  }
  kms_alias = "alias/aws/ssm"

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
