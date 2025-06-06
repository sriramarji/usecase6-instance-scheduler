variable "function_name" {
  type = string
}


/*variable "policy_actions" {
  description = "List of IAM policy actions for the Lambda function"
  type        = list(string)
}*/

variable "tags" {
  type = map(string)
}

