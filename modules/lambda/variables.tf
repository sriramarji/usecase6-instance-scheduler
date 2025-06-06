variable "function_name" {
  description = "lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function description"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "timeout" {
  type    = number
  default = 60
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "lambda_code_path" {
  description = "Path to the Lambda function code"
  type        = string
}

variable "policy_actions" {
  description = "List of IAM policy actions for the Lambda function"
  type        = list(string)
}

variable "role" {
  description = "IAM role ARN for the Lambda function"
  type        = string
}
