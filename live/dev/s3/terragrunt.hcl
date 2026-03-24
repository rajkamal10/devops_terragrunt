include {
  path = find_in_parent_folders()
}

locals {
  env = "dev"
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
  name = "dev-bucket"
  env  = local.env
}
