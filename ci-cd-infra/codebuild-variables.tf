variable "codebuild_plan_project_name" {
  description = "Name for the code build project that is going to do the terraform plan"
  type        = string
  default     = "infra-codebuild-plan"
}

variable "codebuild_apply_project_name" {
  description = "Name for the code build project that is going to do the terraform apply"
  type        = string
  default     = "infra-codebuild-apply"
}