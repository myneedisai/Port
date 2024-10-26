provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = "Dev" # Adjust as needed
  }
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = var.aws_s3_bucket.my_bucket.id
}
