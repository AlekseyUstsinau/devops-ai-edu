output "environment" {
  description = "Deployment environment used for the current Terraform workspace."
  value       = local.environment
}

output "vpc_id" {
  description = "VPC ID for the deployed environment."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of public subnets created for the environment."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of private subnets created for the environment."
  value       = module.network.private_subnet_ids
}

output "nat_gateway_ids" {
  description = "NAT gateway IDs provisioned for private subnet outbound access."
  value       = module.network.nat_gateway_ids
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name."
  value       = module.compute.load_balancer_dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster created for the environment."
  value       = module.compute.cluster_name
}

output "ecs_service_name" {
  description = "Name of the ECS service created for the environment."
  value       = module.compute.service_name
}

output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role."
  value       = module.iam.ecs_task_execution_role_arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket created for application artifacts."
  value       = module.storage.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the artifact storage bucket."
  value       = module.storage.bucket_arn
}
