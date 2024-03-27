# resource "aws_s3_bucket" "s3_bucket_artifact" {
#   bucket = var.s3_bucket_name
# }

# resource "aws_s3_bucket_acl" "s3_bucket_artifact_acl" {
#   bucket = aws_s3_bucket.s3_bucket_artifact.id
#   acl    = var.s3_bucket_acl
# }

# resource "aws_s3_bucket_versioning" "s3_bucket_artifact_versioning" {
#   bucket = aws_s3_bucket.s3_bucket_artifact.id
#   versioning_configuration {
#     status = var.s3_bucket_versioning_enabled
#   }
# }

data "aws_s3_bucket" "s3_bucket_backend" {
  bucket = "mcorall-terraform-tfstate"
}