variable "domain_name" {
  description = "The root domain name for the certificate and Route 53 zone"
  type        = string
}

variable "pollingapp_zone_id" {
  description = "The hosted zone ID of the Route 53 zone where validation records will be created"
  type        = string
}


