output "cluster_id" {
  value = aws_ecs_cluster.main_cluster.id
}

output "cluster_name" {
  value = aws_ecs_cluster.main_cluster.name
}

output "frontend_service_name" {
  value = aws_ecs_service.frontend_service.name
}

output "backend_service_name" {
  value = aws_ecs_service.backend_service.name
}
