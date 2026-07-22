include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "vpc" {
  config_path = "../../vpc"

  mock_outputs = {
    vpc_param_arn = "arn:aws:ssm:us-east-1:000000000000:parameter/mock"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

inputs = {
  vpc_param_arn = dependency.vpc.outputs.vpc_param_arn
}
