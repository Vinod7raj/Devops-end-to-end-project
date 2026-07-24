variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group"
}

variable "retention_days" {
  type        = number
  default     = 7
  description = "Retention period for logs in days"
}

variable "sns_topic_name" {
  type        = string
  description = "Name of the SNS topic for alerts"
}

variable "alert_email" {
  type        = string
  description = "Email address for receiving alerts"
}

variable "alarm_name" {
  type        = string
  description = "Name of the CloudWatch alarm"
}

variable "alarm_evaluation_periods" {
  type        = number
  default     = 2
  description = "Number of consecutive periods to evaluate"
}

variable "period" {
  type        = number
  default     = 60
  description = "Length of each evaluation period in seconds"
}

variable "threshold" {
  type        = number
  default     = 70
  description = "CPU utilization threshold for alarm"
}

variable "cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "service_name" {
  type        = string
  description = "ECS service name"
}
