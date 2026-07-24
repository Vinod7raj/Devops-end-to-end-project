output "log_group_name" {
  value = aws_cloudwatch_log_group.ecs_logs.name
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.ecs_cpu_high.alarm_name
}
