provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_acl

  tags = {
    Name        = var.s3_bucket_name
    Environment = "Dev" # Adjust as needed
  }
}
