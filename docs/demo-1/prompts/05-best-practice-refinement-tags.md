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
- Update each resource to use merge(var.default_tags, local.<resource_specific>) if needed.
OUTPUT: Only changed files (show resource blocks with modifications).
