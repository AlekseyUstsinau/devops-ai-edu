# Prompt 03: FinOps Optimization & Autoscaling
ROLE: FinOps Engineer.
CONTEXT: Best-practices and security hardening passes completed. Now optimize cost & enable elasticity.
TASK: Apply cost & resource efficiency improvements directly AND introduce autoscaling (if not present) using existing services only.
MANDATORY ACTIONS:
- Adjust over-provisioned CPU/memory/task counts (keep safe minimums for demo).
- Set CloudWatch log retention 30 days if missing.
- Introduce conditional apply or skip when no Terraform diff.
- Propose ECS (or relevant service) autoscaling (target tracking) variables & Terraform blocks (commented if new) exposing min/max capacity & CPU (or utilization) target.
- Add caching and path filters in workflow.
- Add table of potential monthly savings (estimates acceptable; mark as approximate).
CONSTRAINTS:
- No new services.
OUTPUT FORMAT (exact headers):
1. Optimization Table (Issue | Change | Approx Savings USD | Notes)
2. Autoscaling Proposal (table + Terraform snippet)
3. Terraform Changes (only changed blocks)
4. Workflow Changes (snippets)
5. Summary (1–2 paragraphs)
