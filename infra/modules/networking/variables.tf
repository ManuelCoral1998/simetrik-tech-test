variable "cidr_block" {
  description = "CIDR Block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets."
  type        = list(string)
}

variable "region" {
  description = "The AWS region in which the network is going to be implemented."
  type        = string
}

variable "azs" {
  description = "List of avaibility zones."
  default     = ["us-east-1a", "us-east-1b"]
  type        = list(string)
}