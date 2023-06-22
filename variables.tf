variable "tags" {
  description = "Tags applied to the resources"
  type        = map(string)
  default     = {}
}

variable "kms_alias" {
  description = "kms_alias sets the kms alias used for SecureString"
  type        = string
  default     = "alias/aws/ssm"
}

variable "name_prefix" {
  description = "name_prefix prefixes the given name with a prefix"
  type        = string
  default     = ""
}

variable "parameters" {
  description = "A list of dicts with parameter information"
  type = list(object({
    name  = string
    type  = optional(string, "SecureString") # String, StringList or SecureString
    value = string
  }))
  default = []
}
