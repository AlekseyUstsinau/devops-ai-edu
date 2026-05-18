# Compute Module

This module deploys the ECS compute layer for the application.

## What it creates

- ECS cluster with container insights enabled
- Application Load Balancer
- Target group and listener for HTTP traffic
- ECS task definition and Fargate service
- CloudWatch log group for container logs

## Inputs

- `project_name`: Project identifier for naming resources
- `environment`: Deployment environment name
- `application_name`: Container name used in task definitions
- `cluster_name`: ECS cluster name
- `service_name`: ECS service name
- `app_container_image`: Image URI for the ECS container
- `app_cpu`: CPU units for the ECS task
- `app_memory`: Memory for the ECS task in MiB
- `app_desired_count`: Desired number of tasks
- `app_port`: Application port exposed by the container and ALB
- `subnet_ids`: Private subnet IDs for ECS tasks
- `alb_security_group_id`: Security group ID for the ALB
- `ecs_security_group_id`: Security group ID for ECS tasks
- `task_execution_role_arn`: IAM role ARN for ECS task execution
- `task_role_arn`: IAM role ARN assumed by the ECS task
- `aws_region`: AWS region for logs and resources
- `tags`: Standardized tags for compute resources

## Outputs

- `cluster_name`
- `service_name`
- `load_balancer_dns_name`
- `task_definition_arn`

## Design notes

The compute module uses AWS Fargate for serverless container execution, an ALB for request routing, and CloudWatch logs for observability. Network configuration is limited to private subnets and least-privilege security groups.
