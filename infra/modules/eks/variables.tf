variable "public_subnets_ids" {
  description = "List of public subnets ids."
  type        = list(string)
}

variable "private_subnets_ids" {
  description = "List of private subnets ids."
  type        = list(string)
}