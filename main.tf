terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.7"
      }
    }
}
provider "aws" {
    region = "us-west-2"
}

module "scp_sandbox" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/*.json")
  json_scp = each.value
  OUs   = var.sandbox_ou
}
