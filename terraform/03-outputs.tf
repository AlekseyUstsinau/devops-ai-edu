output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "vpc_endpoints" {
  description = "VPC endpoints for private subnet access to AWS services"
  value = {
    ecr_dkr = aws_vpc_endpoint.ecr_dkr.id
    ecr_api = aws_vpc_endpoint.ecr_api.id
    logs    = aws_vpc_endpoint.logs.id
    s3      = aws_vpc_endpoint.s3.id
  }
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.main.zone_id
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.main.repository_url
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.main.name
}

# Corporate Site Outputs
output "corp_site_service_name" {
  description = "Name of the Corporate Site ECS service"
  value       = aws_ecs_service.corp_site.name
}

output "corp_site_task_definition_arn" {
  description = "ARN of the Corporate Site ECS task definition"
  value       = aws_ecs_task_definition.corp_site.arn
}

output "corp_site_target_group_arn" {
  description = "ARN of the Corporate Site target group"
  value       = aws_lb_target_group.corp_site.arn
}

output "corp_site_alb_listener_arn" {
  description = "ARN of the Corporate Site ALB listener (shared with main)"
  value       = aws_lb_listener.main.arn
}