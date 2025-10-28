# Prompt 11: App Security & Hardening Refinement

ROLE: Security Reviewer.
TASK: Refine code for least privilege & hardening.
CHECKS:
- Non-root container user.
- Read-only root filesystem (Fargate task definition options if applicable).
- Add IMAGE SCAN step (ECR scan status) or note as future.
- Ensure SG restricts ingress from ALB SG only.
- IAM: execution role -> ECR pull only; task role -> placeholder minimal.
OUTPUT: Only modified code blocks.
