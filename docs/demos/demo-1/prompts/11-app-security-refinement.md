# Prompt 11: App Security & Hardening Refinement

ROLE: Security Reviewer.
TASK: Refine code for least privilege & hardening.
CHECKS:
- Non-root container user (UID 1001 appuser).
- Container port 8080 (non-privileged port).
- Security group rules: ALB SG -> ECS tasks on port 8080 ONLY.
- Health check endpoint /health (not root path).
- Read-only root filesystem (Fargate task definition options if applicable).
- Add IMAGE SCAN step (Trivy or ECR native scanning).
- IAM: execution role -> ECR pull + CloudWatch logs only; task role -> placeholder minimal.
- Verify VPC endpoints for ECR access (no NAT Gateway required).
OUTPUT: Only modified code blocks.
