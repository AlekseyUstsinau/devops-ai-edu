# Prompt 03: Initial Terraform Draft

ROLE: Senior Infrastructure Engineer.
TASK: Produce initial Terraform code for infra ticket.
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
