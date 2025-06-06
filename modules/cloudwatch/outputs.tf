output "cloudwatch_event_rule_id" {
  description = "Cloudwatch Event Rule"
  value       = aws_cloudwatch_event_rule.schedule.id
}

output "cloudwatch_event_rule_arn" {
  description = "displaying rule ran"
  value       = aws_cloudwatch_event_rule.schedule.arn
}

output "cloudwatch_event_target_id" {
  description = "target id"
  value       = aws_cloudwatch_event_target.lambda_target.id
}