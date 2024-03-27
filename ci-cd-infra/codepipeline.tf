
data "aws_codestarconnections_connection" "github_connection" {
  arn = var.github_connection_arn
}

resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline_name
  role_arn = "arn:aws:iam::533267065014:role/codepipeline-role"

  artifact_store {
    type     = "S3"
    location = data.aws_s3_bucket.s3_bucket_backend.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["infra_code"]
      configuration = {
        ConnectionArn        = data.aws_codestarconnections_connection.github_connection.arn
        BranchName           = "master"
        OutputArtifactFormat = "CODE_ZIP"
        FullRepositoryId     = "ManuelCoral1998/simetrik-tech-test"
      }
    }
  }

  stage {
    name = "Plan"
    action {
      name            = "Build"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = ["infra_code"]
      configuration = {
        ProjectName = aws_codebuild_project.plan_stage.name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = ["infra_code"]
      configuration = {
        ProjectName = aws_codebuild_project.apply_stage.name
      }
    }
  }

}