# Lambda Module for EC2 Instance Start 

module "lambda_start_ec2" {
  source        = "./modules/lambda"
  function_name = "${var.project_name}-start-ec2-instances"
  handler       = "start_instances.lambda_handler"
  runtime       = "python3.9"
  timeout       = 60
  role          = module.iam.lambda_role_arn


  environment_variables = {
    TAG_KEY   = var.tag_key
    TAG_VALUE = var.tag_value
    #REGION             = var.aws_region
  }
  lambda_code_path = "${path.module}/source/start_ec2instances.py"
  policy_actions   = ["ec2:DescribeInstances", "ec2:StartInstances"]
  tags             = var.tags
}

# Lambda Module for EC2 Instance stop 

module "lambda_stop_ec2" {
  source        = "./modules/lambda"
  function_name = "${var.project_name}-stop_ec2instances"
  handler       = "stop_instances.lambda_handler"
  runtime       = "python3.9"
  timeout       = 60
  role          = module.iam.lambda_role_arn

  environment_variables = {
    TAG_KEY   = var.tag_key
    TAG_VALUE = var.tag_value
    #REGION             = var.aws_region
  }
  lambda_code_path = "${path.module}/source/stop_ec2instances.py"
  policy_actions   = ["ec2:DescribeInstances", "ec2:StartInstances"]
  tags             = var.tags
}


module "cloudwatch_start_schedule" {
  source               = "./modules/cloudwatch"
  name                 = "${var.project_name}-start-instances-schedule"
  description          = "Triggers Lambda function to start EC2 instances at 8:00 AM on weekdays"
  schedule_expression  = "cron(39 9 * * *)" # 8:00 AM Monday-Friday
  lambda_function_name = module.lambda_start_ec2.lambda_function_name
  lambda_function_arn  = module.lambda_start_ec2.lambda_function_arn
  tags                 = var.tags
}

module "cloudwatch_stop_schedule" {
  source               = "./modules/cloudwatch"
  name                 = "${var.project_name}-stop-instances-schedule"
  description          = "Triggers Lambda function to stop EC2 instances at 5:00 PM on weekdays"
  schedule_expression  = "cron(39 9 * * *)" # 5:00 pm Monday-Friday
  lambda_function_name = module.lambda_stop_ec2.lambda_function_name
  lambda_function_arn  = module.lambda_stop_ec2.lambda_function_arn
  tags                 = var.tags
}

module "iam" {
  source         = "./modules/iam"
  tags           = var.tags
  function_name  = "${var.project_name}-lambda-role"
  policy_actions = ["ec2:DescribeInstances", "ec2:StartInstances"]
}
