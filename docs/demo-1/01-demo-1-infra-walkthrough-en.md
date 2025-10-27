# Demo Walkthrough: From Vague Email to Terraform + CI/CD

## 1. Purpose
Show how a DevOps engineer can use an LLM as a co-pilot to rapidly transform an unstructured business request into:
1. A production-style infrastructure Jira ticket.
2. Iteratively refined Terraform code + GitHub Actions pipeline.
3. A concise impact summary.

**Expected Output**: Audience clearly understands demo goals, deliverables, and evaluation criteria (tickets, code, pipeline, checklist).

---

## 2. Raw Context (Manager Email)

**Demonstrator Action**: Read the email aloud verbatim and pause to ask: "What concrete infra parameters are missing?" Highlight urgency vs lack of specifications.
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines. We need the core structure ready by the end of this week."

Existing Known Patterns (for reference):
- AWS Region: `us-east-1`
- VPC with public & private subnets
- ECS Fargate for services
- ECR for container images
- S3 Terraform backend
- CloudWatch Logs
- GitHub Actions for CI/CD
- Static site (index.html) presented

**Expected Output**: Audience alignment on baseline context and recognition of missing specifics.

---

## 3. Gap Identification & Audience Engagement (Optional if gaps are pre-filled)

**Demonstrator Action**: Read the email aloud. Ask the audience: "What is missing to turn this into actionable engineering work?" Capture answers under categories.

Missing Info Categories:
- Architecture: Network layout, ALB vs CloudFront, NAT, scaling.
- Security: TLS, IAM roles, least privilege, security groups.
- Scalability: Traffic estimates, auto scaling policies.
- Observability: Metrics, log retention, alerts.
- Compliance & Governance: Tags, cost, environment naming.
- Delivery: Branching, pipeline stages, rollback strategy.

Transition: "We'll have the LLM ask us structured clarification questions in themed blocks."

**Expected Output**: Categorized list of gaps ready to feed into the LLM prompt.

---

## 4. Prompt: Clarification Questions (Infra Ticket)

**Demonstrator Action**: Paste prompt exactly; press enter; read first block aloud; ask audience if anything to add before answering.
Paste this prompt:
```
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
- Internet Gateway with public routing
- Private route tables for internal communication
- ALB Security Group: HTTP (port 80) from 0.0.0.0/0

CONSTRAINTS:
- Ask questions in themed blocks: Architecture, Security, Scalability, Observability, Compliance/Governance, Delivery/Workflow.
- After each block STOP so I can answer.
- Focus only on gaps; avoid already-known details.

OUTPUT FORMAT:
Block: <Theme>
Questions:
1. ...
2. ...
```
**Live Tip**: Keep answers concise (bullets). Emphasize speed vs traditional back-and-forth.

**Expected Output**: A clearly themed first block (e.g., Architecture) with focused numbered questions.

---

## 5. Q&A Iterations

**Demonstrator Action**: Answer one block; say "Next block" to progress. Capture each answer under theme headers in a notes pane.
Cycle through each block. Provide short answers (e.g., "ALB for ingress, HTTP only now, TLS phase 2", "Target steady 500 RPS, scale on CPU>60%, min 2 tasks, max 10", etc.). Maintain a running answer sheet for final ticket.

**Expected Output**: Structured answer set covering Architecture, Security, Scalability, Observability, Compliance/Governance, Delivery.

---

## 6. Prompt: Generate Infrastructure Jira Ticket

**Demonstrator Action**: Consolidate notes; paste them cleanly into the prompt; run; skim AC for testability; copy Markdown to Jira.
After all answers gathered, paste:
```
ROLE: DevOps Architect.
TASK: Create the final Infrastructure Jira ticket in Markdown.
INPUT: Consolidated answers (below). <PASTE ALL ANSWERS CLEANLY>
OUTPUT FORMAT (Markdown):
Title: <Concise infra provisioning title>
Description: High-level intent (1–2 paragraphs).
Acceptance Criteria:
- AC-1: <Verifiable check>
- AC-2: ...
Implementation Plan: Ordered list of steps.
Risks & Mitigations: Table or list.
Tags: key-value list (Project, Owner, Environment, CostCenter).
References: Original email, assumptions.
QUALITY RULES:
- Each AC must be testable.
- No speculative items outside provided context.
```
Action: Copy into Jira (manual or via API). Show minimal editing required.

Follow-up Tasks:
- Create GitHub Issue from the Markdown (if using GitHub Issues instead of Jira).
- Create Jira ticket using organization workflow (paste Markdown directly).

**Expected Output**: Polished infrastructure Jira ticket with Title, Description, AC list, Implementation Plan, Risks, Tags, References.

---

## 7. Prompt: Initial Terraform Draft

**Demonstrator Action**: Paste draft prompt; let output complete; confirm all listed files appear; mention deferred items if any.
Generate baseline code.
```
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
```
**Expected Output**: Terraform file blocks matching requested structure with initial resource scaffolding and minimal variables.

---

## 8. Prompt: Add GitHub Actions Pipeline

**Demonstrator Action**: Request pipeline; verify plan/apply separation; highlight secrets usage not plaintext creds.
```
ROLE: CI/CD Engineer.
TASK: Generate GitHub Actions workflow (YAML) to: init, validate, plan, apply Terraform in terraform/ directory.
CONSTRAINTS:
- Use separate jobs or steps for plan vs apply.
- Apply runs only on manual approval or merge to main.
- Pass AWS credentials via GitHub Secrets.
- Cache Terraform plugins for speed.
OUTPUT: Single YAML file.
```
**Expected Output**: One workflow YAML showing jobs/steps: checkout, setup Terraform, init, validate, plan (artifact/comment), gated apply.

---

## 9. Prompt: Best Practice Refinement (Tags & Governance)

**Demonstrator Action**: Run refinement; scan resources for centralized tag map usage; call out governance alignment.
```
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
```
**Expected Output**: Modified resource blocks with standardized tag map usage; no untagged resources remain.

---

## 10. Prompt: Variables Everywhere

**Demonstrator Action**: Execute; verify CIDRs, names, scaling thresholds replaced by variables with descriptions.
```
ROLE: Infra Optimization Engineer.
TASK: Replace remaining hard-coded values with variables (CIDRs, names, scaling values) adding sensible defaults.
CONSTRAINTS:
- Keep complexity moderate.
- Document each variable with description.
OUTPUT: Updated 02-variables.tf and any changed references.
```
**Expected Output**: Expanded variables file plus updated resource references using variables and possibly locals for computed names.

---

## 11. Prompt: Final Validation Checklist

**Demonstrator Action**: Run prompt; optionally perform a quick local `terraform validate`; emphasize checklist as reproducible QA gate.
```
ROLE: Senior Reviewer.
TASK: Provide final checklist verifying:
- terraform validate passes.
- Plan produces only expected resources.
- All resources tagged.
- No plaintext secrets.
- Separation of plan/apply in CI.
- Observability and security enhancements included.
OUTPUT: Markdown checklist.
```
**Expected Output**: Clear verification checklist enumerating readiness criteria for infra and pipeline.

---

### 12. Deployment and Verification (Wrap Up)

**Demonstrator Action:** Conclude the demo by summarizing the total time saved. This is the final impact statement. On this step pipeline could be triggered.
