variable "vpc_param_arn" {
  type = string
}

resource "aws_ssm_parameter" "vpns-b" {
  name        = "/cloud-4527-repro/vpns-marker-b"
  type        = "String"
  value       = "vpns-3"
  description = "depends on ${var.vpc_param_arn}"
}
