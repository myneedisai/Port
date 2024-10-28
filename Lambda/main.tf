provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "lambda_role" {
  name   = "${var.lambda_name}_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "${var.lambda_name}_policy"
  description = "AWS IAM Policy for managing ${var.lambda_name} role"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}

data "archive_file" "zip_the_Python_code" {
  type        = "zip"
  source_dir  = "${path.module}/Lambda/Python/"
  output_path = "${path.module}/Lambda/Python/hello-python.zip"
}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = data.archive_file.zip_the_Python_code.output_path
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
