resource "aws_lambda_function" "function" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  role          = var.role

  filename         = "${path.module}/lambda_function.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = var.environment_variables
  }
  tags = var.tags
}

# Archive the Lambda function code
data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${path.module}/lambda_function.zip"
  source_file = var.lambda_code_path
}