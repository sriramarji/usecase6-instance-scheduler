variable "policy_actions" {
  description = "List of IAM policy actions for the Lambda function"
  type        = list(string)
  default     = []
}

variable "tag_key" {

  description = "Tag key to identify EC2 instances that should be managed by the scheduler"
  type        = string
  default     = "Key name"
}

variable "tag_value" {

  description = "Tag value to identify EC2 instances that should be managed by the scheduler"
  type        = string
  default     = "Hcl-prac-training"
}

variable "tags" {

  description = "Additional tags to apply to all resources"
  type        = map(string)
  default = {
    #Owner      = "Operations"
    #CostCenter = "IT"
  }
}

variable "project_name" {

  description = "Name of the project for resource naming"
  type        = string
  default     = "ec2-scheduler"

}