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
    access_key = "AKIAUFTM4SNQCXNSLISV"
    secret_key = "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"
}

module "scp_sandbox" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/*.json")
  json_scp = each.value
  OUs   = var.sandbox_ou
}
