variable "vpc_param_arn" {
  type = string
}

resource "aws_ssm_parameter" "vpns-b" {
  name        = "/cloud-4527-repro/vpns-marker-bс"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
