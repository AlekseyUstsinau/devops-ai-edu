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

**Demonstrator Action**: Paste prompt exactly; read first block; pause for answers. See prompt file `docs/demo-1/prompts/07-app-clarification-questions.md`.
**Live Tip**: Encourage concise bullet answers for speed.

**Expected Output**: First block (Image Build) questions only.

---

## 5. Q&A Iterations (Collect App Answers)

**Demonstrator Action**: Answer first block; say "Next block" to progress sequentially. Maintain a clean answer sheet.

**Expected Output**: Completed answer set across all themes.

---

## 6. Prompt: Generate Application Deployment Jira Ticket

**Demonstrator Action**: Paste consolidated answers into prompt from `docs/demo-1/prompts/08-generate-app-ticket.md`.

Follow-up Tasks:
- Create GitHub Issue from the Markdown (if using GitHub Issues instead of Jira).
- Create Jira ticket using organization workflow.

**Expected Output**: Polished app deployment ticket.

---

## 7. Prompt: Initial Code Generation (Docker + Incremental Terraform for ECS Service)

**Important Change**: We do NOT create a new Terraform root. We reuse the existing `terraform/` structure from the infrastructure demo and only add the application-specific files/blocks.

**Demonstrator Action**: Request Docker skeleton and incremental Terraform changes (prompt `docs/demo-1/prompts/09-initial-app-code.md`).
**Expected Output**: Dockerfile + new Terraform app-specific files / appended blocks (without duplicating provider and backend).

---

## 8. Prompt: Add GitHub Actions CI/CD Pipeline

**Demonstrator Action**: Use pipeline prompt `docs/demo-1/prompts/10-app-cicd-pipeline.md`.
**Expected Output**: Workflow YAML separating plan/apply with image build, operating against unified Terraform state.

---

## 9. Prompt: Security & Best Practice Refinement

**Demonstrator Action**: Security refinement prompt: `docs/demo-1/prompts/11-app-security-refinement.md`.
**Expected Output**: Adjusted Dockerfile (USER directive), IAM policies, SG rules.

---

## 10. Prompt: Variables Everywhere & Autoscaling

**Demonstrator Action**: Variables & autoscaling prompt: `docs/demo-1/prompts/12-app-variables-autoscaling.md`.
**Expected Output**: Enhanced variables + new autoscaling file in existing Terraform root.

---

## 11. Prompt: Tag & Governance Consistency

**Demonstrator Action**: Tag & governance consistency prompt: `docs/demo-1/prompts/13-app-governance-tags.md`.
**Expected Output**: Uniform tag application via single default_tags map.

---

## 11. Deployment & Verification (Wrap Up)

**Demonstrator Action**: Summarize acceleration vs manual approach; optionally trigger workflow_dispatch run to show build and plan stages. Highlight future phases: TLS on ALB, WAF, image scanning automation, SSM parameter usage.

Impact Statement Template:
"Using the LLM we converted a vague email into a production-ready deployment pipeline with container, Terraform service definition, autoscaling, and governance in under <X> minutes. Manual process would take <Y>."

**Expected Output**: Audience clear on ROI and next evolution steps.
