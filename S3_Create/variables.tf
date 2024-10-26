variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "s3_acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private" # You can adjust this as needed
}

variable "aws_region" {
  description = "The AWS region to create the S3 bucket in"
  type        = string
  default     = "us-east-1" # Change to your desired region
}
