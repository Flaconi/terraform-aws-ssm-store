module "iam_roles" {
  source = "../../"

  tags = {
    "Created by" = "terraform"
  }
  kms_alias = "alias/aws/ssm"

  name_prefix = "/applications/app1"
  parameters = [
    {
      name  = "secure"
      value = "securevalue"
    },
    {
      name  = "secure2"
      value = "securevalue2"
    },
    {
      name  = "insecure"
      value = "insecurevalue"
      type  = "String"
    },
  ]
}
