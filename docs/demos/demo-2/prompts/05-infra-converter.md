# Prompt 05: AWS → Azure Infrastructure Converter

## Context
You are a Multi-Cloud Infrastructure Engineer. An AWS infrastructure exists in the `terraform/` directory using ECS Fargate, ALB, ECR, VPC, IAM roles, and CloudWatch Logs. You need to create equivalent Azure infrastructure.

## Objective
**CREATE NEW TERRAFORM FILES** in a `terraform-azure/` directory that implement equivalent Azure infrastructure. Do not modify existing AWS infrastructure.

## AWS Components to Convert

### Current AWS Stack:
- **Compute**: ECS Fargate service with task definitions
- **Networking**: VPC with public/private subnets, Internet Gateway, NAT Gateway
- **Load Balancing**: Application Load Balancer (ALB) with target groups
- **Container Registry**: ECR repository
- **Identity**: IAM roles (task execution, task role) with policies
- **Logging**: CloudWatch Log Groups
- **Backend**: S3 bucket for Terraform state

## Azure Equivalent Mapping

Map AWS services to Azure equivalents:

| AWS Service | Azure Service | Notes |
|-------------|---------------|-------|
| ECS Fargate | Azure Container Apps | Serverless container platform |
| VPC | Virtual Network (VNet) | Network isolation |
| Subnets | Subnets | Same concept |
| Internet/NAT Gateway | NAT Gateway (optional) | For outbound connectivity |
| ALB | Application Gateway or Front Door | Layer 7 load balancing |
| ECR | Azure Container Registry (ACR) | Container image registry |
| IAM Roles | Managed Identities | Identity and access management |
| CloudWatch Logs | Log Analytics Workspace | Centralized logging |
| S3 (state) | Azure Storage Account | Terraform state backend |

## Expected Actions

**YOU MUST:**
1. **Read existing AWS Terraform files** in the `terraform/` directory to understand the architecture
2. **Create a new directory** `terraform-azure/` at the same level as `terraform/`
3. **Create Azure Terraform files** with proper structure:
   - `00-config.tf` - Terraform and Azure provider configuration
   - `01-provider.tf` - Azure provider settings
   - `02-variables.tf` - Input variables
   - `03-outputs.tf` - Output values
   - `resource-group.tf` - Azure Resource Group
   - `vnet.tf` - Virtual Network and Subnets
   - `acr.tf` - Azure Container Registry
   - `container-app.tf` - Azure Container Apps
   - `app-gateway.tf` - Application Gateway (or comment alternative)
   - `log-analytics.tf` - Log Analytics Workspace
   - `managed-identity.tf` - Managed Identities
   - `locals.tf` - Local values and tags
4. **Parameterize all values** using variables
5. **Use consistent naming** and tagging conventions
6. **Add comments** explaining Azure-specific concepts

**DO NOT:**
- Modify or delete existing AWS infrastructure in `terraform/`
- Create a production-ready setup (demo-focused is fine)
- Add advanced security features (keep it simple)

## Output Format

After creating all Azure Terraform files, provide a summary report:

### 1. Files Created
| File | Purpose | Key Resources |

### 2. Service Mapping Summary
| AWS Service | Azure Equivalent | Migration Notes |

### 3. Key Differences
Highlight important differences between AWS and Azure implementations:
- **Networking**: [VPC vs VNet differences]
- **Container Platform**: [ECS vs Container Apps differences]
- **Identity**: [IAM vs Managed Identity differences]
- **Logging**: [CloudWatch vs Log Analytics differences]

### 4. Configuration Variables
List key variables that need to be set:
- `location` - Azure region (e.g., "eastus")
- `environment` - Environment name
- `project_name` - Project identifier
- [other critical variables]

### 6. Cost Comparison Notes
Brief notes on cost differences between AWS and Azure for this architecture

## Constraints
- Keep the Azure implementation **demo-focused** (not production-hardened)
- Use **Azure best practices** where applicable (naming conventions, resource groups, tags)
- Ensure **feature parity** with AWS implementation (same capabilities)
- Use **modern Azure services** (Container Apps over AKS for simplicity)
- **Document** any functionality gaps or differences
