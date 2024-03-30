resource "aws_codebuild_project" "plan_stage" {
  name         = var.codebuild_plan_project_name
  description  = "Terraform Plan Stage for infra"
  service_role = var.codebuild_role_arn_plan_stage

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = var.codebuild_env_compute_type_plan_stage
    image        = var.codebuild_env_image_plan_stage
    type         = var.codebuild_env_type_plan_stage
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/validate-and-plan.yml")
  }
}

resource "aws_codebuild_project" "apply_stage" {
  name         = var.codebuild_apply_project_name
  description  = "Terraform Apply Stage for infra"
  service_role = var.codebuild_role_arn_apply_stage

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = var.codebuild_env_compute_type_apply_stage
    image        = var.codebuild_env_image_apply_stage
    type         = var.codebuild_env_type_apply_stage
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/apply.yml")
  }
}