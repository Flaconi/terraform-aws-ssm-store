output "parameter_arns" {
  description = "Map of parameter name and arn"
  value       = { for k, v in aws_ssm_parameter.this : k => v.arn }
}
