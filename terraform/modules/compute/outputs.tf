output "cluster_name" {
  description = "Name of the ECS cluster created."
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "Name of the ECS service created."
  value       = aws_ecs_service.this.name
}

output "load_balancer_dns_name" {
  description = "DNS name for the application load balancer."
  value       = aws_lb.this.dns_name
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition."
  value       = aws_ecs_task_definition.this.arn
}
