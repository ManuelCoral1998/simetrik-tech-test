terraform {
  backend "s3" {
    bucket = "mcorall-terraform-tfstate"
    region = "us-east-1"
    key    = "state/terraform.tfstate"
  }
}