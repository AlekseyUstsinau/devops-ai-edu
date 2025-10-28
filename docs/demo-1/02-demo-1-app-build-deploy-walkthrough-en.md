# Demo Walkthrough: From Clarified Requirements to App Build + ECS Deployment

## 1. Purpose
Show how a DevOps engineer + LLM co-pilot transform vague deployment needs into:
1. A production-style application deployment Jira ticket (separate from infra ticket).
2. Iteratively refined Docker + Terraform ECS task/service + GitHub Actions pipeline.
3. Final validation checklist ensuring secure, tagged, reproducible deployment.

**Expected Output**: Audience sees the acceleration from raw requirement to a deployable static site container running on ECS Fargate behind existing ALB.

---

## 2. Raw Context (Manager Email + App Requirement)

**Demonstrator Action**: Read the email aloud; add the distilled application requirement; highlight missing build/deploy specifics.
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines with steps: build app, push to ECR, deploy. We need the core structure ready by the end of this week."

Application Deployment Need (extracted):
- Deploy initial static corporate website (index.html artifact) as containerized service.
- Build steps: package static files, produce Docker image, push to ECR, update ECS service.
- Use GitHub Actions for CI/CD.
- Reuse existing infra: VPC, Subnets, ALB, ECS Cluster, ECR repo (or create if missing), IAM roles, CloudWatch Logs.

**Known Infra (from previous walkthrough)**:
- Region: `us-east-1`.
- VPC CIDR `10.0.0.0/16` with public (ALB) + private (Fargate tasks) subnets.
- Existing ALB SG: HTTP 80 from 0.0.0.0/0 (TLS phase 2).
- ECS Cluster provisioned.
- S3 backend, CloudWatch logging pattern.

**Expected Output**: Recognition that we still lack app-specific container, runtime, health check, scaling thresholds, repo naming, branch strategy, tagging patterns.

---

## 3. Gap Identification (Application Deployment)

**Demonstrator Action**: Ask audience: "What is missing to make the app deploy work item actionable?" Capture answers under themes.

---

## 4. Prompt: Clarification Questions (Application Ticket)

**Demonstrator Action**: Paste prompt exactly; read first block; pause for answers.
```
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
```
**Live Tip**: Encourage concise bullet answers for speed.

**Expected Output**: First block (Image Build) questions only.

---

## 5. Q&A Iterations (Collect App Answers)

**Demonstrator Action**: Answer first block; say "Next block" to progress sequentially. Maintain a clean answer sheet.

**Expected Output**: Completed answer set across all themes.

---

## 6. Prompt: Generate Application Deployment Jira Ticket

**Demonstrator Action**: Paste consolidated answers into prompt.
```
ROLE: DevOps Architect.
TASK: Create the Application Deployment Jira ticket in Markdown.
INPUT: Summary from QA section
OUTPUT FORMAT:
Title: <Concise app deployment title>
Description: 1–2 paragraphs describing intent.
Acceptance Criteria:
- AC-1: ... (verifiable)
- AC-2: ...
Implementation Plan: Ordered list.
Risks & Mitigations: List or table.
Tags: key-value list.
References: Infra ticket, manager email, assumptions.
QUALITY RULES:
- Each AC testable & scoped.
- No items outside provided answers.

Save it as markdown file under docs/ folder
```

Follow-up Tasks:
- Create GitHub Issue from the Markdown (if using GitHub Issues instead of Jira).
- Create Jira ticket using organization workflow.

**Expected Output**: Polished app deployment ticket.

---

## 7. Prompt: Initial Code Generation (Docker + Incremental Terraform for ECS Service)

**Important Change**: We do NOT create a new Terraform root. We reuse the existing `terraform/` structure from the infrastructure demo and only add the application-specific files/blocks.

**Demonstrator Action**: Request Docker skeleton and incremental Terraform changes.
```
ROLE: Senior Infrastructure & App Engineer.
TASK: Produce initial code to deploy the static site container using existing infra Terraform root.
OUTPUT STRUCTURE (ADDITIONS ONLY):
app/
  Dockerfile
  README.md            # brief build & run instructions
terraform/             # existing root from infra demo (DO NOT duplicate backend/provider)
  ecs-task-definition-app.tf   # if task tefenition not exist already
  ecs-service-app.tf           # if not exist already
  app-security-groups.tf       # (only if separate SG needed to restrict ingress from ALB SG)
  ecs-autoscaling-app.tf       # (added later in autoscaling step; placeholder comment ok now)
  locals-app.tf                # (optional) naming helpers, or extend existing locals
  # updates inside existing 02-variables.tf (append new variables) – do NOT create a second variables file
  # updates inside existing 03-outputs.tf (append outputs)
CONSTRAINTS:
- Reuse backend & provider blocks (NO new 00-config.tf / 01-provider.tf).
- Reference existing ECS cluster, VPC subnets, ALB / target group via variables or data sources (no hard-coded IDs).
- Use nginx base image.
- Configure container health check (HTTP path "/").
- Start with minimal new variables; extend later.
- Tags: use merge(var.default_tags, { Component = "CorpSite" }).
- Keep resource names clearly separated (e.g., aws_ecs_task_definition.corp_site, aws_ecs_service.corp_site).
OUTPUT STYLE:
- Provide only new files' full content and appended blocks for modified existing files.
```
**Expected Output**: Dockerfile + new Terraform app-specific files / appended blocks (without duplicating provider and backend).

---

## 8. Prompt: Add GitHub Actions CI/CD Pipeline

**Demonstrator Action**: Generate workflow for build -> push -> plan -> deploy using existing `terraform/` directory (no separate terraform-app path).
```
ROLE: CI/CD Engineer.
TASK: Create GitHub Actions workflow yaml to build & deploy app.
NAME: main.yml
TRIGGERS: manual workflow_dispatch.
JOBS:
- build_and_push: build image, login ECR, push (tags: sha, 'latest').
- terraform_plan: runs on PR & main pushes (depends on build), executes terraform inside terraform/ root, outputs plan artifact.
- terraform_apply: runs only on manual approval + push to main (environment protection) or workflow_dispatch; executes terraform apply in terraform/ root.
CONSTRAINTS:
- Use AWS creds via secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION.
- Cache Terraform plugins & modules.
- Post plan summary as PR comment.
- Fail fast on lint (optional step) for Dockerfile.
- Ensure plan/apply restricted to app-related changes (optionally detect path filter: app/** OR terraform/*ecs-*app* files).
OUTPUT: Single YAML.
```
**Expected Output**: Workflow YAML separating plan/apply with image build, operating against unified Terraform state.

---

## 9. Prompt: Security & Best Practice Refinement

**Demonstrator Action**: Instruct LLM to refine code for security.
```
ROLE: Security Reviewer.
TASK: Refine code for least privilege & hardening.
CHECKS:
- Non-root container user.
- Read-only root filesystem (Fargate task definition options if applicable).
- Add IMAGE SCAN step (ECR scan status) or note as future.
- Ensure SG restricts ingress from ALB SG only.
- IAM: execution role -> ECR pull only; task role -> placeholder minimal.
OUTPUT: Only modified code blocks.
```
**Expected Output**: Adjusted Dockerfile (USER directive), IAM policies, SG rules.

---

## 10. Prompt: Variables Everywhere & Autoscaling

**Demonstrator Action**: Expand variables set (in existing `terraform/02-variables.tf`) and add autoscaling file.
```
ROLE: Infra Optimization Engineer.
TASK: Replace remaining literals (cpu, memory, desired/min/max counts, health check path, scaling thresholds) with variables + descriptions.
Add autoscaling resource blocks (application autoscaling for ECS service) based on CPU>60% in new file: terraform/ecs-autoscaling-app.tf.
OUTPUT: Updated appended section for 02-variables.tf + new ecs-autoscaling-app.tf + any updated references.
```
**Expected Output**: Enhanced variables + new autoscaling file in existing Terraform root.

---

## 11. Prompt: Tag & Governance Consistency

**Demonstrator Action**: Centralize tags across existing root (including new app resources).
```
ROLE: Governance Reviewer.
TASK: Ensure all Terraform resources (including newly added app-specific ones) in terraform/ use centralized tag map.
VARIABLE: default_tags (Project, Owner, Environment, CostCenter).
RULE: merge(var.default_tags, { Component = "CorpSite" }).
OUTPUT: Show changed blocks only (for resources missing the pattern) and confirm no duplicate tag logic introduced.
```
**Expected Output**: Uniform tag application via single default_tags map.

---

## 11. Deployment & Verification (Wrap Up)

**Demonstrator Action**: Summarize acceleration vs manual approach; optionally trigger workflow_dispatch run to show build and plan stages. Highlight future phases: TLS on ALB, WAF, image scanning automation, SSM parameter usage.

Impact Statement Template:
"Using the LLM we converted a vague email into a production-ready deployment pipeline with container, Terraform service definition, autoscaling, and governance in under <X> minutes. Manual process would take <Y>."

**Expected Output**: Audience clear on ROI and next evolution steps.
