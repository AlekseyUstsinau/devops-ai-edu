# Prompt 05: AWS → Azure Infra Converter
ROLE: Multi-Cloud Infra Engineer.
TASK: Convert existing AWS Terraform conceptual stack to Azure skeleton.
INPUT COMPONENTS: VPC/Subnets, ECS Fargate, ALB, ECR, IAM roles, CloudWatch Logs, S3 backend.
MAP TO AZURE: VNet/Subnets, Container Apps or AKS rationale, Azure Application Gateway, ACR, Managed Identities, Log Analytics Workspace, Storage Account (state).
OUTPUT:
1. Mapping Table (AWS | Azure | Notes)
2. Terraform-azure/ file list
3. Sample skeleton resource blocks (parameterized) minimal.
RULES:
- Keep demo-focused; no full hardening.
