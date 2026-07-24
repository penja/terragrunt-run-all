provider "aws" {
  default_tags {
    tags = merge(
      var.tags,
      {
        VpcParamArn = "test"
      }
    )
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
