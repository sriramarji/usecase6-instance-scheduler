output "lambda_role_arn" {
  description = "ARN of IAM role for Lambda function"
  value       = aws_iam_role.lambda_role.arn
}

output "lambda_role_name" {
  description = "AM role name for the Lambda function"
  value       = aws_iam_role.lambda_role.name
}