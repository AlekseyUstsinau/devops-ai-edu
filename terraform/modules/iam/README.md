# IAM Module

This module creates AWS IAM roles and policies for ECS task execution.

## What it creates

- ECS task execution role
- ECS task role
- Minimal custom IAM policy for pulling container images and writing logs
- IAM role policy attachment for execution permissions

## Inputs

- `project_name`: Project identifier for naming roles and policies
- `environment`: Deployment environment name
- `aws_region`: AWS region for policy ARNs
- `ecr_repository_name`: ECR repository name used to scope permissions
- `tags`: Standardized tags for IAM resources

## Outputs

- `ecs_task_execution_role_arn`
- `ecs_task_role_arn`

## Design notes

This module avoids broad wildcard IAM permissions where possible. It scopes log writing and image pull permissions to explicit resources and uses AWS service principals for role assumption.
