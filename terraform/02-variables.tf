variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "demo"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "corporate-website"
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "ssverchkov"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ecs_task_cpu" {
  description = "CPU units for ECS task"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Memory for ECS task"
  type        = number
  default     = 512
}

variable "ecs_desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 2
}

variable "ecs_max_capacity" {
  description = "Maximum number of ECS tasks"
  type        = number
  default     = 10
}

variable "cpu_scale_threshold" {
  description = "CPU percentage threshold for scaling"
  type        = number
  default     = 60
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 7
}

# Container Configuration
variable "container_port" {
  description = "Port number for the container"
  type        = number
  default     = 80
}

variable "container_image_tag" {
  description = "Docker image tag for deployment"
  type        = string
  default     = "latest"
}

# Load Balancer Configuration
variable "lb_protocol" {
  description = "Protocol for load balancer listener"
  type        = string
  default     = "HTTP"
}

variable "lb_port" {
  description = "Port for load balancer listener"
  type        = number
  default     = 80
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for load balancer"
  type        = bool
  default     = false
}

# Health Check Configuration
variable "health_check_enabled" {
  description = "Enable health check for target group"
  type        = bool
  default     = true
}

variable "health_check_healthy_threshold" {
  description = "Number of consecutive health checks successes required"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Number of consecutive health check failures required"
  type        = number
  default     = 2
}

variable "health_check_timeout" {
  description = "Health check timeout in seconds"
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "Health check interval in seconds"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_matcher" {
  description = "HTTP response codes to indicate a healthy check"
  type        = string
  default     = "200"
}

# CloudWatch Alarm Configuration
variable "alarm_evaluation_periods" {
  description = "Number of periods over which data is compared to threshold"
  type        = number
  default     = 2
}

variable "alarm_period" {
  description = "Period in seconds over which the specified statistic is applied"
  type        = number
  default     = 300
}

variable "alarm_failure_threshold" {
  description = "Threshold for ECS task failure alarm"
  type        = number
  default     = 10
}

# ECS Scaling Configuration
variable "ecs_min_capacity" {
  description = "Minimum number of ECS tasks for auto scaling"
  type        = number
  default     = 2
}

# Centralized Tags Configuration
variable "default_tags" {
  description = "Default tags to be applied to all resources"
  type        = map(string)
  default = {
    Project     = "Demo AI"
    Owner       = "DevOps"
    Environment = "Prod"
    CostCenter  = "Web"
    ManagedBy   = "terraform"
  }
}

# Corporate Site Configuration
variable "corp_site_task_cpu" {
  description = "CPU units for Corporate Site ECS task"
  type        = number
  default     = 256 # 0.25 vCPU
}

variable "corp_site_task_memory" {
  description = "Memory for Corporate Site ECS task"
  type        = number
  default     = 512 # 0.5 GB
}

variable "corp_site_desired_count" {
  description = "Desired number of Corporate Site ECS tasks"
  type        = number
  default     = 1
}

variable "corp_site_image_tag" {
  description = "Docker image tag for Corporate Site deployment"
  type        = string
  default     = "latest"
}

# Corporate Site Auto Scaling (for future use)
variable "corp_site_min_capacity" {
  description = "Minimum number of Corporate Site ECS tasks for auto scaling"
  type        = number
  default     = 1
}

variable "corp_site_max_capacity" {
  description = "Maximum number of Corporate Site ECS tasks for auto scaling"
  type        = number
  default     = 5
}

variable "corp_site_cpu_scale_threshold" {
  description = "CPU percentage threshold for Corporate Site scaling"
  type        = number
  default     = 70
}