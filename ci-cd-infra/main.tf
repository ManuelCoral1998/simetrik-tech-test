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