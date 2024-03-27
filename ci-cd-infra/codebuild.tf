resource "aws_codebuild_project" "plan_stage" {
  name         = var.codebuild_plan_project_name
  description  = "Terraform Plan Stage for infra"
  service_role = "arn:aws:iam::533267065014:role/codebuild-role"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:latest"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/validate-and-plan.yml")
  }
}

resource "aws_codebuild_project" "apply_stage" {
  name         = var.codebuild_apply_project_name
  description  = "Terraform Apply Stage for infra"
  service_role = "arn:aws:iam::533267065014:role/codebuild-role"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:latest"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/apply.yml")
  }
}