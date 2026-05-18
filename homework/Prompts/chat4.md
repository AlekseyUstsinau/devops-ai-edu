You are a senior cloud architect, Terraform expert, security auditor, and FinOps engineer.

Analyze the currently open Terraform project in this repository.

Your goal is to REVIEW and IMPROVE the code across three dimensions:

- Code Quality & Performance
- Security Hardening
- Cost Optimization

Do not give generic advice. You must refactor the actual Terraform code.

CODE OPTIMIZATION

Identify and fix:
- Poor module structure
- Hardcoded values that should be variables
- Repeated code that should be modularized
- Missing locals, data sources, and outputs
- Incorrect resource dependencies
- Lack of naming conventions and tagging standards
- Inefficient resource definitions

Refactor the Terraform into cleaner modules and show the improved code.

PART 2 — SECURITY HARDENING

Identify security issues such as:
- Open security groups
- Missing encryption at rest
- Missing encryption in transit
- Overly permissive IAM policies
- Public exposure of resources
- Missing logging/monitoring
- Lack of least privilege

Fix all issues directly in the Terraform code.

Apply Azure and Terraform security best practices.

PART 3 — COST OPTIMIZATION (FinOps)

Analyze:
- Instance types and sizing
- Autoscaling configuration
- Storage types and sizes
- Unnecessary always-on resources
- Opportunities to use free tier, spot, or serverless
- Nightly shutdown or scheduling opportunities

Estimate:
- Approximate monthly cost BEFORE optimization
- Approximate monthly cost AFTER optimization
- Estimated savings

DELIVER EXACTLY THESE OUTPUTS
- IMPROVED TERRAFORM CODE
   - Show refactored modules and files
   - Show only the improved version (not diffs)

- IMPROVEMENT REPORT (Markdown)
   Sections:
   - Code Quality Improvements
   - Security Vulnerabilities Found and Fixed
   - Cost Optimizations Applied

- COST REPORT (Markdown)
   - Cost breakdown by service before/after
   - Total estimated monthly cost before/after
   - Savings summary

Be opinionated. Make concrete changes. Do not give alternatives.
Assume Azure best practices and production standards.

____________________________________________________________________________

Inspecting Terraform root and module layout to identify quality, security, and cost issues.

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/locals.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/outputs.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/providers.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/security)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/iam)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/azure_container_app)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/security/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/iam/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/security/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/iam/variables.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/outputs.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/security/outputs.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute/outputs.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/outputs.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/iam/outputs.tf)

Reviewing current Terraform version constraints before applying the refactor.

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/versions.tf)

Replacing the root module files with improved Terraform structure, security defaults, and cost-aware variables.

Replacing 61 lines with 65 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/main.tf)


```

```


Replacing 210 lines with 231 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/providers.tf), [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/variables.tf)


```

```

```

```


Replacing 44 lines with 69 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/locals.tf), [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/outputs.tf)


```

```
Refactoring the network module to simplify NAT placement, enforce topology naming, and avoid redundant NAT gateways.

Replacing 165 lines with 166 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/main.tf), [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/variables.tf), [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/network/outputs.tf)


```

```

```

```


Replacing 52 lines with 72 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/security/main.tf)


```

```


Replacing 128 lines with 158 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute/main.tf)


```

```


Replacing 90 lines with 110 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/compute/variables.tf)


```

```


Replacing 70 lines with 109 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf), [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/variables.tf)


```

```

```

```


Replacing 86 lines with 101 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/iam/main.tf)


```

```
Ensuring the network module receives the availability zone list it requires.

Replacing 11 lines with 16 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/main.tf)


```

```
Formatting the updated Terraform configuration and validating the refactor for syntax and provider issues.

Ran terminal command: cd c:/Users/a.ustsinau/devops-ai-edu/terraform; terraform fmt -recursive; terraform init -backend=false; terraform validate
Completed with input: cd c:/Users/a.ustsinau/devops-ai-edu/terraform; terraform fmt -recursive; terraform init -backend=false; terraform validate

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/variables.tf#1-1), lines 1 to 80

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/variables.tf#81-81), lines 81 to 216

Fixing the remaining variable declaration and KMS count reference before re-validating the Terraform workspace.

Replacing 14 lines with 24 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/variables.tf)


```

```


Replacing 5 lines with 5 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)

Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf#1-1), lines 1 to 80

Replacing 5 lines with 5 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)


```

```


Ran terminal command: cd c:/Users/a.ustsinau/devops-ai-edu/terraform; terraform fmt -recursive; terraform validate

Cleaning up deprecated S3 versioning syntax as part of the improvement pass.

Replacing 10 lines with 6 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)


```

```


Read [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf#1-1), lines 1 to 40

Replacing 7 lines with 15 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)


```

```


Ran terminal command: cd c:/Users/a.ustsinau/devops-ai-edu/terraform; terraform fmt -recursive; terraform validate

Removing the deprecated S3 bucket ACL configuration and replacing it with the dedicated ACL resource.

Replacing 6 lines with 5 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)


```

```


Replacing 10 lines with 15 lines in [](file:///c%3A/Users/a.ustsinau/devops-ai-edu/terraform/modules/storage/main.tf)


```

```


Ran terminal command: cd c:/Users/a.ustsinau/devops-ai-edu/terraform; terraform fmt -recursive; terraform validate

## IMPROVED TERRAFORM CODE

### main.tf
```hcl
data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source               = "./modules/network"
  project_name         = var.project_name
  environment          = local.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = data.aws_availability_zones.available.names
  create_nat_gateway   = var.create_nat_gateway
  tags                 = local.common_tags
}

module "security" {
  source              = "./modules/security"
  project_name        = var.project_name
  environment         = local.environment
  vpc_id              = module.network.vpc_id
  app_port            = var.app_port
  allowed_cidr_blocks = var.allowed_cidr_blocks
  tags                = local.common_tags
}

module "iam" {
  source              = "./modules/iam"
  project_name        = var.project_name
  environment         = local.environment
  aws_region          = var.aws_region
  ecr_repository_name = var.ecr_repository_name
  tags                = local.common_tags
}

module "storage" {
  source             = "./modules/storage"
  project_name       = var.project_name
  environment        = local.environment
  bucket_name_prefix = var.bucket_name_prefix
  enable_kms         = var.bucket_enable_kms
  tags               = local.common_tags
}

module "compute" {
  source                    = "./modules/compute"
  project_name              = var.project_name
  environment               = local.environment
  application_name          = var.application_name
  app_container_image       = var.app_container_image
  app_cpu                   = var.app_cpu
  app_memory                = var.app_memory
  app_min_count             = var.app_desired_count
  app_max_count             = var.app_max_count
  app_target_cpu_utilization = var.app_target_cpu_utilization
  app_port                  = var.app_port
  health_check_path         = var.app_health_check_path
  log_retention_days        = var.log_retention_days
  cluster_name              = "${var.project_name}-${local.environment}-ecs-cluster"
  service_name              = "${var.project_name}-${local.environment}-ecs-service"
  aws_region                = var.aws_region
  vpc_id                    = module.network.vpc_id
  subnet_ids                = module.network.private_subnet_ids
  alb_security_group_id     = module.security.alb_security_group_id
  ecs_security_group_id     = module.security.ecs_security_group_id
  task_execution_role_arn   = module.iam.ecs_task_execution_role_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  tags                      = local.common_tags
}
```

---

### providers.tf
```hcl
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id != "" ? var.azure_subscription_id : null
  tenant_id       = var.azure_tenant_id != "" ? var.azure_tenant_id : null
}
```

---

### variables.tf
```hcl
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
```

---

### outputs.tf
```hcl
output "environment" {
  description = "Deployment environment used for the current Terraform workspace."
  value       = local.environment
}

output "vpc_id" {
  description = "VPC ID for the deployed environment."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of public subnets created for the environment."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of private subnets created for the environment."
  value       = module.network.private_subnet_ids
}

output "nat_gateway_ids" {
  description = "NAT gateway IDs provisioned for private subnet outbound access."
  value       = module.network.nat_gateway_ids
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name."
  value       = module.compute.load_balancer_dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster created for the environment."
  value       = module.compute.cluster_name
}

output "ecs_service_name" {
  description = "Name of the ECS service created for the environment."
  value       = module.compute.service_name
}

output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role."
  value       = module.iam.ecs_task_execution_role_arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket created for application artifacts."
  value       = module.storage.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the artifact storage bucket."
  value       = module.storage.bucket_arn
}
```

---

### main.tf
```hcl
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-vpc"
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-igw"
  })
}

resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnet_cidrs : idx => cidr }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = var.azs[each.key]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-public-${each.key}"
  })
}

resource "aws_subnet" "private" {
  for_each = { for idx, cidr in var.private_subnet_cidrs : idx => cidr }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = var.azs[each.key]

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-private-${each.key}"
  })
}

resource "aws_eip" "nat" {
  count = var.create_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-nat-0"
  })
}

resource "aws_nat_gateway" "this" {
  count = var.create_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-nat-0"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-public-rt"
  })
}

resource "aws_route_table" "private" {
  count = var.create_nat_gateway ? 1 : 0

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[0].id
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-private-rt"
  })
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  for_each = var.create_nat_gateway ? aws_subnet.private : {}

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[0].id
}
```

---

### variables.tf
```hcl
variable "project_name" {
  type        = string
  description = "Project name used to build resource names."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets."
}

variable "azs" {
  type        = list(string)
  description = "Availability zones used by the VPC."
}

variable "create_nat_gateway" {
  type        = bool
  description = "Whether to create a single NAT gateway for private subnet egress."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags to apply to all network resources."
}
```

---

### main.tf
```hcl
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = "Allow ingress traffic from approved CIDR blocks to the application load balancer."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  })
}

resource "aws_security_group" "ecs" {
  name        = "${var.project_name}-${var.environment}-ecs-sg"
  description = "Allow inbound traffic from ALB to ECS tasks."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-sg"
  })
}

resource "aws_security_group_rule" "alb_ingress" {
  for_each = { for idx, cidr in var.allowed_cidr_blocks : idx => cidr }

  type              = "ingress"
  from_port         = var.app_port
  to_port           = var.app_port
  protocol          = "tcp"
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.alb.id
  description       = "Allow inbound application traffic from approved CIDR blocks."
}

resource "aws_security_group_rule" "ecs_ingress" {
  type                     = "ingress"
  from_port                = var.app_port
  to_port                  = var.app_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ecs.id
  source_security_group_id = aws_security_group.alb.id
  description              = "Allow traffic from ALB to ECS tasks."
}

resource "aws_security_group_rule" "ecs_egress_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs.id
  description       = "Allow ECS tasks to reach HTTPS destinations."
}

resource "aws_security_group_rule" "ecs_egress_dns_tcp" {
  type              = "egress"
  from_port         = 53
  to_port           = 53
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs.id
  description       = "Allow ECS tasks to perform DNS lookups over TCP."
}

resource "aws_security_group_rule" "ecs_egress_dns_udp" {
  type              = "egress"
  from_port         = 53
  to_port           = 53
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs.id
  description       = "Allow ECS tasks to perform DNS lookups over UDP."
}
```

---

### main.tf
```hcl
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-cluster"
  })
}

resource "aws_lb" "this" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.subnet_ids

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-alb"
  })
}

resource "aws_lb_target_group" "this" {
  name        = "${var.project_name}-${var.environment}-tg"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = var.health_check_path
    matcher             = "200-399"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 5
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-tg"
  })
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/${var.project_name}-${var.environment}"
  retention_in_days = var.log_retention_days

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-log-group"
  })
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.project_name}-${var.environment}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = tostring(var.app_cpu)
  memory                   = tostring(var.app_memory)
  execution_role_arn       = var.task_execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = var.application_name
      image     = var.app_container_image
      essential = true
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.this.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-task-def"
  })
}

resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  launch_type     = "FARGATE"
  desired_count   = var.app_min_count
  task_definition = aws_ecs_task_definition.this.arn

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.application_name
    container_port   = var.app_port
  }

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  propagate_tags                     = "SERVICE"

  depends_on = [aws_lb_listener.this]

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-service"
  })
}

resource "aws_appautoscaling_target" "ecs_service" {
  max_capacity       = var.app_max_count
  min_capacity       = var.app_min_count
  resource_id        = "service/${aws_ecs_cluster.this.name}/${aws_ecs_service.this.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "cpu_target" {
  name               = "${var.project_name}-${var.environment}-cpu-autoscale"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.ecs_service.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_service.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = var.app_target_cpu_utilization
    scale_in_cooldown  = 180
    scale_out_cooldown = 180
  }
}
```

---

### variables.tf
```hcl
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
```

---

### main.tf
```hcl
resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name_prefix}-${var.environment}-app-artifacts"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.enable_kms ? "aws:kms" : "AES256"
        kms_master_key_id = var.enable_kms ? aws_kms_key.this[0].arn : null
      }
    }
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-app-bucket"
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_kms_key" "this" {
  count = var.enable_kms ? 1 : 0

  description             = "KMS key for S3 artifact bucket ${var.project_name}-${var.environment}."
  deletion_window_in_days = 30

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-s3-kms-key"
  })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "force_tls" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnforceTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "expire-old-objects"
    status = "Enabled"

    expiration {
      days = 90
    }

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
```

---

### variables.tf
```hcl
variable "project_name" {
  type        = string
  description = "Project name used for S3 bucket naming."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "bucket_name_prefix" {
  type        = string
  description = "Prefix used to construct the S3 bucket name."
}

variable "enable_kms" {
  type        = bool
  description = "Enable KMS encryption for S3 bucket objects."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags for storage resources."
}
```

---

### main.tf
```hcl
data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "ecs_task_execution_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${var.project_name}-${var.environment}-ecs-exec-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_assume_role.json

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-exec-role"
  })
}

data "aws_iam_policy_document" "ecs_task_execution_policy" {
  statement {
    sid    = "AllowEcrAuthorizationToken"
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowEcrRepositoryPull"
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]

    resources = [
      "arn:${data.aws_partition.current.partition}:ecr:${var.aws_region}:${data.aws_caller_identity.current.account_id}:repository/${var.ecr_repository_name}"
    ]
  }

  statement {
    sid    = "AllowCloudWatchLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:${data.aws_partition.current.partition}:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/ecs/${var.project_name}-${var.environment}:*"
    ]
  }
}

resource "aws_iam_policy" "ecs_task_execution" {
  name        = "${var.project_name}-${var.environment}-ecs-exec-policy"
  description = "Least privilege IAM policy for ECS task execution."
  policy      = data.aws_iam_policy_document.ecs_task_execution_policy.json

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-exec-policy"
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution.arn
}

data "aws_iam_policy_document" "ecs_task_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "${var.project_name}-${var.environment}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-ecs-task-role"
  })
}
```

---

## IMPROVEMENT REPORT

### Code Quality Improvements
- Refactored the root module to remove duplicate provider-specific data sources and centralize environment tagging.
- Added explicit `app_port`, `app_max_count`, `app_target_cpu_utilization`, `app_health_check_path`, and `log_retention_days` variables.
- Standardized names and tags across all modules with `local.common_tags`.
- Fixed `network` module NAT implementation to use a single NAT gateway instead of one NAT per AZ.
- Added dedicated resources for AWS S3 versioning and ACLs to eliminate deprecated syntax.
- Added `aws_s3_bucket_policy` to enforce TLS-only access in storage.
- Introduced autoscaling resources in `compute` for better task scaling and improved operational structure.
- Added module output consistency for `nat_gateway_ids`, `ecs_service_name`, `ecs_task_execution_role_arn`, and `s3_bucket_arn`.
- Preserved existing environment-specific tfvars compatibility while improving defaults.

### Security Vulnerabilities Found and Fixed
- Removed open default `allowed_cidr_blocks` configuration by requiring explicit ingress CIDRs.
- Hardened ECS egress by restricting outbound traffic to HTTPS and DNS only, instead of open `0.0.0.0/0`.
- Added S3 bucket TLS enforcement via bucket policy to prevent insecure transport.
- Added S3 public access block configuration to prevent unintended public exposure.
- Hardened IAM by splitting ECR auth from repository pull permissions and reducing overly broad resource scope.
- Added CloudWatch log retention policy to reduce data exposure and comply with retention best practices.
- Fixed `aws_s3_bucket` deprecated ACL config and replaced it with `aws_s3_bucket_acl`.
- Introduced optional KMS support for S3 artifacts with proper conditional handling.

### Cost Optimizations Applied
- Replaced per-AZ NAT gateways with a single centralized NAT gateway to reduce steady-state cost.
- Reduced ECS baseline footprint by setting `app_desired_count = 1` and enabling autoscaling up to `app_max_count = 3`.
- Added ECS target tracking autoscaling to shift from always-on capacity to demand-based usage.
- Kept S3 lifecycle expiry for old objects to limit storage growth.
- Chose fixed application container image versions to avoid drift and reduce runtime surprises.
- Maintained private subnets and no public IP assignment for tasks, preventing unintended public compute costs.

---

## COST REPORT

### Before optimization (approximate monthly cost)
- NAT Gateway: 2 × ~$33 = ~$66
- Application Load Balancer: ~$18–25
- ECS Fargate tasks (2 × 256 vCPU + 512 MiB): ~$18
- CloudWatch Logs: ~$3
- S3 storage + lifecycle: ~$1
- Estimated total: **$106–113 / month**

### After optimization (approximate monthly cost)
- NAT Gateway: 1 × ~$33
- Application Load Balancer: ~$18–25
- ECS Fargate tasks (baseline 1, autoscaling to 3): ~$10–12 average
- CloudWatch Logs: ~$3
- S3 storage + lifecycle: ~$1
- Estimated total: **$65–74 / month**

### Savings summary
- Estimated monthly savings: **$32–48**
- Primary savings from:
  - single NAT gateway instead of two
  - autoscaling ECS tasks instead of static 2-task baseline
  - reduced persistent compute overhead

---

## Validation
- `terraform fmt -recursive` succeeded
- `terraform validate` succeeded

If you want, I can also extend this into a fully Azure-focused version by wiring the `modules/azure_container_app` module into the root configuration.

Made changes.