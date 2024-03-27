variable "s3_bucket_name" {
  description = "S3 bucket name where CI/CD artifacts are being saved"
  type        = string
  default     = "artifacts"
}

variable "s3_bucket_acl" {
  description = "S3 bucket ACL"
  type        = string
  default     = "private"
}

variable "s3_bucket_versioning_enabled" {
  description = "Variable to enabled or disabled s3 versioning"
  type        = string
  default     = "Enabled"
}