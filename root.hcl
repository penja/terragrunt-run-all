generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "s3" {}
}
EOF
}



generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    variable "owner" {
      type        = string
      description = "Team owning the unit"
      default     = "platform-team"
    }

    locals {
      cost_center = "cc-$${var.owner}-$${terraform.workspace}"
    }

    provider "aws" {
      default_tags {
        tags = {
          Environment = "Test"
          Module      = "${basename(get_terragrunt_dir())}"
          UnitPath    = "${path_relative_to_include()}"
          Owner       = var.owner
          CostCenter  = local.cost_center
        }
      }
    }
  EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "scalr-e2e-tg-test"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-ssh-table"
  }
}
