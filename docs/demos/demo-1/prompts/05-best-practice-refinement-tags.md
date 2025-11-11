# Prompt 05: Best Practice Refinement (Tags & Governance)

ROLE: Infra Reviewer.

TASK: Refine Terraform: ensure every resource has standard tags. Apply other best practises if applicable.
TAGS (add if missing):
- Project = "Demo AI"
- Owner = "DevOps"
- Environment = "Prod"
- CostCenter = "Web"

RULES:
- Centralize tag map variable.
- Update each resource to use merge(var.default_tags, { Component = "..." }) pattern.
- Use VPC endpoints for ECR/S3 instead of NAT Gateway
- Remove unnecessary default ECS services until application-specific requirements are defined.

OUTPUT: Only changed files (show resource blocks with modifications).
