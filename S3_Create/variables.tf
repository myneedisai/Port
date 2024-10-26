variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "s3_acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
}
