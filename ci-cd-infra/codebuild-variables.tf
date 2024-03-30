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

variable "codebuild_role_arn_plan_stage" {
  description = "IAM Role codepipeline ARN"
  type        = string
  default     = "arn:aws:iam::533267065014:role/codebuild-role"
}

variable "codebuild_env_compute_type_plan_stage" {
  description = "The compute type for plan stage in code build"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "codebuild_env_image_plan_stage" {
  description = "The base image to use in code build for the plan stage"
  type        = string
  default     = "hashicorp/terraform:latest"
}

variable "codebuild_env_type_plan_stage" {
  description = "Codebuild type for the plan stage"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "codebuild_role_arn_apply_stage" {
  description = "IAM Role codepipeline ARN"
  type        = string
  default     = "arn:aws:iam::533267065014:role/codebuild-role"
}

variable "codebuild_env_compute_type_apply_stage" {
  description = "The compute type for plan stage in code build"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "codebuild_env_image_apply_stage" {
  description = "The base image to use in code build for the plan stage"
  type        = string
  default     = "hashicorp/terraform:latest"
}

variable "codebuild_env_type_apply_stage" {
  description = "Codebuild type for the plan stage"
  type        = string
  default     = "LINUX_CONTAINER"
}