# Prompt 07: Application Deployment Clarification Questions

ROLE: You are an experienced DevOps Architect & Business Analyst.

TASK: Transform high-level app deployment need into a fully specified Application Deployment Jira ticket by first asking clarification questions.

INPUT (Context):
- Manager Email:
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines with steps: build app, push to ECR, deploy. We need the core structure ready by the end of this week."
- Existing Infra: VPC, Subnets, ALB (HTTP 80), ECS Cluster, ECR, IAM baseline, CloudWatch Logs.
- Artifact: Static website (index.html and assets).
- ECS Task and service should be created for that deployment under terraform folder, if they do not exist yet
- Use bestpractices instead of asking if applicable
- Github workflow: manual trigger with no approvals
- Github workflow: stages: build -> push to ECR -> deploy to ECS
- Do not bring other services except core ones required for run service.
- tag latest everytime for demo
- keep it simple
- Keep default values where possible
- amd64 arch only
- No ENV vars to pass
- No secrets to pass
- sipliest health check
- CPU/MEM for demo purposes keep minimal
- Use bestpractises for dockerfile
- 80 port
- bestpractise for deployment strategy
- no storage required
- minimum traffic expected
- no autoskaling for demo
- desired count = 1
- Single AZ
- No TLS
- IAM only for pull from ECR
- Internet should allow to pull from ECR
- No secretes
- No Security scans
- no waf
- Use bestpractices instead of asking if applicable
- Very minimum observability with default values where possible.
- Github workflow: manual trigger with no approvals
- Github workflow: stages: build -> push to ECR -> deploy to ECS

CONSTRAINTS:
- Ask questions in themed blocks: Image Build, Runtime Config, Scaling, Security, Observability, Delivery/Workflow, Governance.
- After each block STOP.
- Avoid already-known infra details unless variance required.

OUTPUT FORMAT:
Block: <Theme>
Questions:
1. ...
2. ...
