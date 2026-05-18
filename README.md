# DevOps AI Education - Final Project

This repository contains materials for the final project of the "DevOps AI Education" course. The project includes a complete, modular Terraform codebase for AWS infrastructure with environment separation, remote state management, and production-ready security controls.

## 📂 Repository Contents

```
devops-ai-edu/
├── README.md
├── .gitignore
├── homework/
│   ├── README.md
│   ├── task1.md
│   ├── task2.md
│   ├── task3.md
│   └── task4.md
└── terraform/
    ├── README.md
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── providers.tf
    ├── versions.tf
    ├── modules/
    │   ├── iam/
    │   ├── network/
    │   ├── compute/
    │   ├── security/
    │   └── storage/
    └── envs/
        ├── dev/
        ├── staging/
        └── prod/
```

## 🏗️ Terraform Architecture Overview

The Terraform architecture is designed for production-grade AWS deployments with separate modules for:

- `modules/network`: VPC, public/private subnets, NAT gateways, and routing
- `modules/security`: Application load balancer and ECS task security groups
- `modules/iam`: ECS task execution and task IAM roles with least-privilege policies
- `modules/storage`: Encrypted S3 bucket and lifecycle management
- `modules/compute`: ECS Fargate cluster, ALB, task definition, and service

Environment-specific values are stored in `terraform/envs/{dev,staging,prod}` and the root module orchestrates all child modules.

## 🌐 Environment Separation

Each environment is fully isolated by using separate:

- `terraform.tfvars` files for environment-specific configuration
- `backend.hcl` files for separate S3 state buckets and DynamoDB locks
- VPC CIDRs and subnet ranges
- ECS clusters, load balancers, IAM roles, and S3 buckets

## ⚖️ Best Practices Included

- Modular Terraform structure with one module per responsibility
- Use of `for_each` instead of `count` for resource collections
- Variables with strong type constraints and validation rules
- Standardized tags on all resources
- Least-privilege IAM policies and roles
- No hardcoded ARNs in module code
- Data sources for region and availability zone selection

## 🚀 Deployment Instructions

### 1. Initialize an environment

```bash
cd terraform
terraform init -backend-config=envs/dev/backend.hcl
```

### 2. Review the plan

```bash
terraform plan -var-file=envs/dev/terraform.tfvars
```

### 3. Apply the environment

```bash
terraform apply -var-file=envs/dev/terraform.tfvars
```

### 4. Destroy when done

```bash
terraform destroy -var-file=envs/dev/terraform.tfvars
```

Repeat these steps for `staging` and `prod` by replacing `dev` with the target environment.

## 📌 Notes

- The AWS S3 backend is configured per environment using environment-specific `backend.hcl` files.
- All resources are tagged with `Project`, `Environment`, `Owner`, and `ManagedBy = Terraform`.
- The repository is designed to be production-ready and reusable across environments.

---

**Last Updated**: May 2026
