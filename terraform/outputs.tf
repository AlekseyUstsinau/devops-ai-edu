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

output "alb_dns_name" {
  description = "Application Load Balancer DNS name."
  value       = module.compute.load_balancer_dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster created for the environment."
  value       = module.compute.cluster_name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket created for application artifacts."
  value       = module.storage.bucket_name
}
