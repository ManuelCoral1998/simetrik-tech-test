terraform {
  backend "s3" {
    bucket = "mcorall-terraform-tfstate"
    region = "us-east-1"
    key    = "state/ci-cd-infra-terraform.tfstate"
  }
}