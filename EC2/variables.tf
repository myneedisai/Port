variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-west-1"  # Change as necessary
}

variable "ec2_name" {
  type = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0da424eb883458071"
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"  # Change as necessary
}

variable "pem_key_name" {
  description = "The key name to use for the EC2 instance"
  type        = string
}
