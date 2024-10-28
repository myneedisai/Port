variable "lambda_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "lambda_handler" {
  description = "The function entrypoint in your code."
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function (e.g., python3.8)."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
}
