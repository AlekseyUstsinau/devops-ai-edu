variable "project_name" {
  type        = string
  description = "Project name used for ECS resources."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "application_name" {
  type        = string
  description = "Application name used in the ECS task definition."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service."
}

variable "app_container_image" {
  type        = string
  description = "Container image URI for the ECS task."
}

variable "app_cpu" {
  type        = number
  description = "CPU units for the ECS task."
}

variable "app_memory" {
  type        = number
  description = "Memory in MiB for the ECS task."
}

variable "app_min_count" {
  type        = number
  description = "Minimum number of ECS tasks to run."
}

variable "app_max_count" {
  type        = number
  description = "Maximum number of ECS tasks allowed by autoscaling."
}

variable "app_target_cpu_utilization" {
  type        = number
  description = "Target CPU utilization for ECS autoscaling."
}

variable "app_port" {
  type        = number
  description = "Application port used by ECS containers and target group."
}

variable "health_check_path" {
  type        = string
  description = "Health check path used by the load balancer target group."
}

variable "log_retention_days" {
  type        = number
  description = "CloudWatch log retention period for ECS task logs."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID used by the target group and ECS networking."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for ECS tasks."
}

variable "alb_security_group_id" {
  type        = string
  description = "Security group ID for the application load balancer."
}

variable "ecs_security_group_id" {
  type        = string
  description = "Security group ID for ECS tasks."
}

variable "task_execution_role_arn" {
  type        = string
  description = "ARN of the IAM role used by ECS task execution."
}

variable "task_role_arn" {
  type        = string
  description = "ARN of the IAM role assumed by the ECS task."
}

variable "aws_region" {
  type        = string
  description = "AWS region for ECS resources and logs."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags for compute resources."
}
