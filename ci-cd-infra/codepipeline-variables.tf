variable "github_connection_arn" {
  description = "ARN of the existing github connection"
  type        = string
  default     = "arn:aws:codestar-connections:us-east-1:533267065014:connection/64f62c13-cb02-49d0-b2d5-16450813c826"
}

variable "codepipeline_name" {
  description = "Code pipeline name"
  type        = string
  default     = "ci-cd-infra-pipeline"
}

variable "codepipeline_role_arn" {
  description = "IAM Role codepipeline ARN"
  type        = string
  default     = "arn:aws:iam::533267065014:role/codepipeline-role"
}

variable "repository_id" {
  description = "The github repository to get the code"
  type        = string
  default     = "ManuelCoral1998/simetrik-tech-test"
}

variable "repository_branch_name" {
  description = "The branch to get the code"
  type        = string
  default     = "master"
}