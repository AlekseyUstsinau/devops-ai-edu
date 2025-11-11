# Prompt 01: Clarification Questions

ROLE: You are an experienced DevOps Architect & Business Analyst.
TASK: Transform a high-level requirement into a fully specified Infra provisioning Jira ticket by first asking clarification questions.

PREREQUISITES: Before starting, ensure user has completed setup from ../PREREQUISITES.md:
- ⚠️ **CRITICAL FIRST STEP**: .gitignore file created (prevents committing Terraform state and secrets)
- AWS CLI + Python installed and configured
- Terraform installed  
- GitHub CLI (optional)
- AWS credentials configured and working
- Git configured

INPUT (Manager Email):
"Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines. We need the core structure ready by the end of this week."

KNOWN EXISTING PATTERNS:
- Region: us-east-1 (default for demo)
- Environment: single (dev/demo only)
- VPC:
    - CIDR: 10.0.0.0/16
    - 2 Availability Zones: us-east-1a, us-east-1b
    - Public subnets: 10.0.1.0/24, 10.0.2.0/24 (for ALB)
    - Private subnets: 10.0.3.0/24, 10.0.4.0/24 (for ECS tasks)
    - Internet Gateway with public routing
    - Private route tables for internal communication
- ECS Fargate:
    - Single ECS service (default for demo)
    - Minimum 1 ECS task (default for demo)
    - ECS task can pull images from ECR
    - No auto-scaling or custom scaling policies (default for demo)
- ECR:
    - Private ECR repository should be created for project
    - ECR access for ECS tasks and GitHub Actions (for pushing images)
- S3 backend:
    - State bucket: `cloud-infrastructure-tfstate-prod` in `us-east-1`
    - No DynamoDB lock
    - Verify S3 backend bucket exists before Terraform (handled outside CI/CD)
- ALB:
    - Internet-facing only (default for demo)
    - Security Group: HTTP (port 80) open to 0.0.0.0/0
    - No custom DNS, TLS, or CDN required
- Security:
    - Only 0.0.0.0/0 whitelisted for HTTP
    - ECS traffic allows pull from ECR
    - IAM roles/policies should follow least privilege best practices
    - Resource encryption: use AWS best practices (default)
- Observability:
    - CloudWatch Logs integration for ECS tasks (default)
    - No additional monitoring, alarms, or log forwarding (default for demo)
    - Log retention: AWS default
    - Resource usage metrics: not required for demo
- Compliance/Governance:
    - Resource tagging/labeling: use AWS best practices
    - No audit logging or resource change tracking required
    - Default AWS account, no org restrictions
    - No data residency or regulatory requirements
    - No resource inventory or documentation required beyond Terraform codebase
- Delivery/Workflow:
    - GitHub Actions workflow: manual trigger only, no approvals
    - Use default AWS credential variable names in GitHub secrets
    - Workflow naming: use best practices
    - No notifications required
    - S3 backend bucket verification handled outside CI/CD
- No static data on S3/RDS
- No other services except core ones required for running the service
- Use best practices for naming conventions
- Terraform code should be parameterized with variables, not hardcoded
- If a default value or best practice exists, use it for demo without asking


CONSTRAINTS:
- Ask questions in themed blocks: Architecture, Security, Scalability, Observability, Compliance/Governance, Delivery/Workflow.
- After each block STOP so I can answer.
- Focus only on gaps; avoid already-known details.
- Keep it simple. For demo purposes i dont need a lot of details and customization.

OUTPUT FORMAT:
Block: <Theme>
Questions:
1. ...
2. ...
