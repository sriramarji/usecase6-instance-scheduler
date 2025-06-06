variable "name" {
  description = "CloudWatch Events rule name"
  type        = string
}

variable "description" {
  description = "CloudWatch Events rule description"
  type        = string
}

variable "schedule_expression" {
  description = "Schedule expression for CloudWatch Events rule"
  type        = string
}

variable "lambda_function_name" {
  description = "Tags to apply for all resources"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of Lambda function to be triggered"
  type        = string
}

variable "tags" {
  description = "Name of Lambda function to be triggered"
  type        = map(string)
  default     = {}
}