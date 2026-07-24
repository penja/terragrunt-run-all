variable "vpc_param_arn" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Test"
    Name        = "Provider Tag"
  }
}

resource "aws_ssm_parameter" "vpns-a" {
  name        = "/cloud-4527-repro/vpns-marker"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
