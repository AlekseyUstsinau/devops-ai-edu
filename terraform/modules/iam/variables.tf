variable "project_name" {
  type        = string
  description = "Project name used for IAM resource names."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "aws_region" {
  type        = string
  description = "AWS region used to construct IAM policy scope."
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name used in ECS task execution policy."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags to apply to IAM resources."
}
