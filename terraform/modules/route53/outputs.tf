output "domain_name" {
  value = aws_route53_zone.pollingapp_zone.name
}

output "zone_id" {
  value = aws_route53_zone.pollingapp_zone.id
}
