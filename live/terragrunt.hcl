locals {
  region = "ap-south-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-state-${local.region}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
}
EOF
}
