locals {
  # create a distrinct map of the different types
  parameters_distinct_on_type = { for ka in var.parameters : ka.type => ka... }
}

### If we have SecureString, create the datasource for the kms_key
data "aws_kms_key" "this" {
  count  = signum(length(lookup(local.parameters_distinct_on_type, "SecureString", [])))
  key_id = var.kms_alias
}

resource "aws_ssm_parameter" "this" {
  for_each = { for parameter in var.parameters : parameter.name => parameter }

  name   = format("%s%s", var.name_prefix, each.value.name)
  type   = lookup(each.value, "type", "SecureString")
  value  = each.value.value
  key_id = lookup(each.value, "type", "SecureString") != "SecureString" ? null : concat(data.aws_kms_key.this.*.arn, [""])[0]
  tags   = var.tags
}
