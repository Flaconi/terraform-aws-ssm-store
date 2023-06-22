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
      name  = "secure"
      value = "securevalue"
      type  = "SecureString"
    },
    {
      name  = "secure2"
      value = "securevalue2"
      type  = "SecureString"
    },
    {
      name  = "insecure"
      value = "insecurevalue"
      type  = "String"
    },
  ]
}
