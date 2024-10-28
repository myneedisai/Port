output "terraform_aws_role_output" {
  description = "The name of the IAM role created for the Lambda function."
  value       = aws_iam_role.lambda_role.name
}

output "terraform_aws_role_arn_output" {
  description = "The ARN of the IAM role created for the Lambda function."
  value       = aws_iam_role.lambda_role.arn
}

output "terraform_logging_arn_output" {
  description = "The ARN of the IAM policy for logging."
  value       = aws_iam_policy.iam_policy_for_lambda.arn
}

# Additional Outputs
output "lambda_function_name" {
  description = "The name of the created Lambda function."
  value       = aws_lambda_function.terraform_lambda_func.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the created Lambda function."
  value       = aws_lambda_function.terraform_lambda_func.arn
}
