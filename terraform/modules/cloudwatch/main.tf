resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = var.log_group_name
  retention_in_days = var.retention_days
}

resource "aws_sns_topic" "alerts" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.period
  statistic           = "Average"
  threshold           = var.threshold
  alarm_description   = "Alarm when ECS CPU > ${var.threshold}%"
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  alarm_actions = [aws_sns_topic.alerts.arn]
}
