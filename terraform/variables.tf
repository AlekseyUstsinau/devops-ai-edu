variable "environment" {
  type        = string
  default     = ""
  description = "Deployment environment identifier. If empty, terraform workspace is used."
  validation {
    condition     = var.environment == "" || contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod, or blank to use the current workspace."
  }
}

variable "project_name" {
  type        = string
  default     = "devops-ai-edu"
  description = "High-level project identifier used to name and tag resources."
  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name cannot be empty."
  }
}

variable "owner" {
  type        = string
  default     = "DevOps Team"
  description = "Primary owner or team responsible for the infrastructure."
  validation {
    condition     = length(trimspace(var.owner)) > 0
    error_message = "owner cannot be empty."
  }
}

variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region for infrastructure deployment."
  validation {
    condition     = length(trimspace(var.aws_region)) > 0
    error_message = "aws_region cannot be empty."
  }
}

variable "application_name" {
  type        = string
  default     = "web-app"
  description = "Logical name of the application being deployed."
  validation {
    condition     = length(trimspace(var.application_name)) > 0
    error_message = "application_name cannot be empty."
  }
}

variable "app_container_image" {
  type        = string
  default     = "public.ecr.aws/nginx/nginx:1.26.0"
  description = "Container image used by the ECS task. Fixed image versions reduce drift and security risk."
  validation {
    condition     = length(trimspace(var.app_container_image)) > 0
    error_message = "app_container_image cannot be empty."
  }
}

variable "app_cpu" {
  type        = number
  default     = 256
  description = "Fargate task CPU allocation in CPU units."
  validation {
    condition     = var.app_cpu >= 256 && var.app_cpu <= 4096
    error_message = "app_cpu must be between 256 and 4096."
  }
}

variable "app_memory" {
  type        = number
  default     = 512
  description = "Fargate task memory allocation in MiB."
  validation {
    condition     = var.app_memory >= 512 && var.app_memory <= 8192
    error_message = "app_memory must be between 512 and 8192."
  }
}

variable "app_desired_count" {
  type        = number
  default     = 1
  description = "Minimum number of ECS tasks to maintain."
  validation {
    condition     = var.app_desired_count >= 1 && var.app_desired_count <= 10
    error_message = "app_desired_count must be between 1 and 10."
  }
}

variable "app_port" {
  type        = number
  default     = 80
  description = "Network port exposed by the application container."
  validation {
    condition     = var.app_port > 0 && var.app_port <= 65535
    error_message = "app_port must be a valid port number."
  }
}

variable "app_max_count" {
  type        = number
  default     = 3
  description = "Maximum number of ECS tasks allowed by autoscaling."
  validation {
    condition     = var.app_max_count >= var.app_desired_count && var.app_max_count <= 10
    error_message = "app_max_count must be between app_desired_count and 10."
  }
}

variable "app_target_cpu_utilization" {
  type        = number
  default     = 60
  description = "Target CPU utilization for ECS autoscaling."
  validation {
    condition     = var.app_target_cpu_utilization >= 40 && var.app_target_cpu_utilization <= 80
    error_message = "app_target_cpu_utilization must be between 40 and 80."
  }
}

variable "app_health_check_path" {
  type        = string
  default     = "/"
  description = "Health check path used by the load balancer target group."
}

variable "log_retention_days" {
  type        = number
  default     = 30
  description = "CloudWatch Logs retention period for ECS task logs."
  validation {
    condition     = var.log_retention_days >= 7 && var.log_retention_days <= 3650
    error_message = "log_retention_days must be between 7 and 3650."
  }
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the application VPC."
  validation {
    condition     = length(trimspace(var.vpc_cidr)) > 0
    error_message = "vpc_cidr cannot be empty."
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR blocks for public subnets. Must match the number of availability zones used."
  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "At least two public_subnet_cidrs entries are required."
  }
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  description = "CIDR blocks for private subnets. Must match the number of availability zones used."
  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "At least two private_subnet_cidrs entries are required."
  }
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "CIDR blocks allowed to access the application load balancer. Must be explicitly configured for production."
  validation {
    condition     = length(var.allowed_cidr_blocks) > 0
    error_message = "allowed_cidr_blocks must contain at least one CIDR block. Avoid 0.0.0.0/0 for production."
  }
}

variable "create_nat_gateway" {
  type        = bool
  default     = true
  description = "Create a single NAT gateway for private subnet outbound access."
}

variable "ecr_repository_name" {
  type        = string
  default     = "app-repository"
  description = "ECR repository name used for task execution permissions."
  validation {
    condition     = length(trimspace(var.ecr_repository_name)) > 0
    error_message = "ecr_repository_name cannot be empty."
  }
}

variable "bucket_name_prefix" {
  type        = string
  default     = "devops-ai-edu"
  description = "Prefix used to construct the S3 bucket name in the storage module."
  validation {
    condition     = length(trimspace(var.bucket_name_prefix)) > 0
    error_message = "bucket_name_prefix cannot be empty."
  }
}

variable "bucket_enable_kms" {
  type        = bool
  default     = false
  description = "Enable KMS encryption for the application artifact bucket."
}

variable "azure_subscription_id" {
  type        = string
  default     = ""
  description = "Azure subscription ID used for Terraform Azure resources."
}

variable "azure_tenant_id" {
  type        = string
  default     = ""
  description = "Azure tenant ID used for Azure CLI authentication, if required."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to merge with standardized project tags."
}
