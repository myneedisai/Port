output "lambda_arn" {
  value = aws_lambda_function.my_lambda.arn
}

output "lambda_name" {
  value = aws_lambda_function.my_lambda.function_name
}

output "lambda_runtime" {
  value = aws_lambda_function.my_lambda.runtime
}

output "lambda_handler" {
  value = aws_lambda_function.my_lambda.handler
}
