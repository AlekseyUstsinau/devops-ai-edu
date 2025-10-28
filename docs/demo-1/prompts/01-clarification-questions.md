# Prompt 01: Clarification Questions

ROLE: You are an experienced DevOps Architect & Business Analyst.
TASK: Transform a high-level requirement into a fully specified Infra provisioning Jira ticket by first asking clarification questions.

INPUT (Manager Email):
"Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines. We need the core structure ready by the end of this week."

KNOWN EXISTING PATTERNS:
- Region: us-east-1
- VPC (public + private subnets), ECS Fargate, ECR, S3 backend, CloudWatch Logs, GitHub Actions, static site artifact.
- VPC with CIDR: 10.0.0.0/16
- 2 Availability Zones: us-east-1a, us-east-1b
- Public subnets: 10.0.1.0/24, 10.0.2.0/24 (for ALB)
- Private subnets: 10.0.3.0/24, 10.0.4.0/24 (for ECS tasks)
- ECS task should have access to pull images from ECR
- keep 80 open for 0.0.0.0
- Internet Gateway with public routing
- Private route tables for internal communication
- ALB Security Group: HTTP (port 80) from 0.0.0.0/0

- ECR creation required.
- No custom DNS required. Only ALB DNS will be used for demo.
- No TLS required.
- No CDN required.
- No static data on S3/RDS

- Use bestpractices for name convenction
- Terraform should not be hardcoded but parameterized with vaariables
- state bucket `cloud-infrastructure-tfstate-prod` in eu-central-1, no dynamodb lock

- Github workflow: manual trigger with no approvals
- Github workflow: use access/secret keys from github secrets

- Use bestpractices instead of asking if applicable
- Do not bring other services except core ones required for run service.

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
