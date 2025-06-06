output "lambda_function_arn" {
  description = "Lambda function ARN"
  value       = aws_lambda_function.function.arn
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.function.function_name
}