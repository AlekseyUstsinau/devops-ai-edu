variable "project_name" {
  type        = string
  description = "Project name used to build security group names."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be created."
}

variable "app_port" {
  type        = number
  description = "Application port used by the load balancer and ECS tasks."
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to reach the ALB."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags for security resources."
}
