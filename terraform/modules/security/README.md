# Security Module

This module creates security groups and traffic rules for the AWS application stack.

## What it creates

- ALB security group for inbound web traffic
- ECS task security group for internal application traffic
- Security group rules that limit access to approved CIDRs
- Explicit outbound permissions for ECS tasks

## Inputs

- `project_name`: Project identifier for naming resources
- `environment`: Deployment environment name
- `vpc_id`: VPC ID for security groups
- `app_port`: Application port used by ALB and ECS tasks
- `allowed_cidr_blocks`: Source CIDR blocks allowed for ALB access
- `tags`: Standardized tags for all security resources

## Outputs

- `alb_security_group_id`
- `ecs_security_group_id`

## Design notes

The module uses explicit security group rules and avoids broad ACLs. Traffic is only allowed from the ALB to ECS on the application port, implementing network-level least privilege.
