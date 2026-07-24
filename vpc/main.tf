variable "tags" {
  type = map(string)
  default = {
    Environment = "Test"
    Name        = "Provider Tag"
  }
}



resource "aws_ssm_parameter" "vpc" {
  name  = "/cloud-4527-repro/vpc-marker"
  type  = "String"
  value = "vpc"
}

output "vpc_param_arn" {
  value = aws_ssm_parameter.vpc.arn
}
