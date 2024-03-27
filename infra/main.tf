provider "aws" {
  shared_credentials_file = " ~/.aws/credentials"
  region                  = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "networking" {
  source          = "./modules/networking"
  region          = var.aws_region
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  cidr_block      = "10.0.0.0/16"
}

module "eks" {
  source = "./modules/eks"

  private_subnets_ids = module.networking.private_subnet_ids

  public_subnets_ids = module.networking.public_subnet_ids

  depends_on = [module.networking]
}