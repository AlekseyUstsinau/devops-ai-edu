# Prompt 03: Initial Terraform Draft

ROLE: Senior Infrastructure Engineer.
TASK: Produce initial Terraform code for infra ticket.

SECURITY CHECK: Verify .gitignore file exists with Terraform exclusions before creating any .tf files!

OUTPUT FILE STRUCTURE (STRICT):
terraform/
  00-config.tf          # backend & required versions
  01-provider.tf        # provider config
  02-variables.tf       # minimal variables with defaults
  03-outputs.tf         # key outputs
  vpc.tf                # VPC resource(s)
  subnets.tf            # public/private subnets
  security-groups.tf    # security groups
  alb.tf                # Application Load Balancer
  ecr.tf                # ECR repository
  ecs-cluster.tf        # ECS cluster definition
  ecs-service.tf        # ECS service & task
  iam.tf                # IAM roles/policies
  ...
CONSTRAINTS:
- Use region variable with default us-east-1.
- Keep variables minimal first (expand later).
- No hard-coded secrets.
- Reasonable naming conventions.
- Only resources directly referenced by tickets.
- Use VPC endpoints for ECR/S3 access instead of NAT Gateway (cost optimization).
- Do NOT create default ECS service/task until specific application requirements are defined.
- Container ports should default to 8080 (non-privileged port).
- Ask user for S3 backend bucket name and check if it exists.
- If S3 backend bucket doesn't exist, provide creation steps before Terraform init.
