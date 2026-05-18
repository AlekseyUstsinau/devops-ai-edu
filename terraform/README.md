# Terraform Infrastructure

This directory contains the root Terraform configuration for AWS infrastructure.

## Architecture Overview

The root module orchestrates five child modules:

- `modules/network`: VPC, public/private subnets, NAT gateways, and routing
- `modules/security`: Application load balancer and ECS task security groups
- `modules/iam`: ECS task execution and task IAM roles with least-privilege policies
- `modules/storage`: Encrypted S3 bucket for artifacts and lifecycle management
- `modules/compute`: ECS Fargate cluster, ALB, task definition, and service

## Folder Structure

- `main.tf`: Root module orchestration and module calls
- `variables.tf`: Root-level variables with validation rules
- `outputs.tf`: Shared outputs for environment information
- `providers.tf`: AWS provider and data sources
- `versions.tf`: Terraform version and backend configuration
- `modules/`: Reusable child modules
- `envs/`: Environment-specific variable and backend config files

## Deployment Instructions

Initialize the environment with the backend config file:

```bash
cd terraform
terraform init -backend-config=envs/dev/backend.hcl
```

Plan and apply:

```bash
terraform plan -var-file=envs/dev/terraform.tfvars
terraform apply -var-file=envs/dev/terraform.tfvars
```

Destroy:

```bash
terraform destroy -var-file=envs/dev/terraform.tfvars
```

## Environment Configurations

Each environment directory contains:

- `terraform.tfvars`: Environment-specific variables
- `backend.hcl`: Remote backend configuration for S3 state and DynamoDB locking

## Best Practices

- Use explicit variable validation, no hardcoded values
- Pass a standardized tag map into all modules
- Use `for_each` where collections are created
- Prefer data sources for environment information
- Avoid explicit `depends_on` unless resource order is required
