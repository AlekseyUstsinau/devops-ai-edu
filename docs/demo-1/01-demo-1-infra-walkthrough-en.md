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

**Expected Output**: Categorized list of gaps ready to feed into the LLM prompt.

---

## 4. Prompt: Clarification Questions (Infra Ticket)

**Demonstrator Action**: Paste prompt exactly; press enter; read first block aloud; ask audience if anything to add before answering.
Paste this prompt (external file): see `docs/demo-1/prompts/01-clarification-questions.md`.
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
After all answers gathered, paste the Jira generation prompt from `docs/demo-1/prompts/02-generate-jira-ticket.md`.
Action: Copy into Jira (manual or via API). Show minimal editing required.

Follow-up Tasks:
- Create GitHub Issue from the Markdown (if using GitHub Issues instead of Jira).
- Create Jira ticket from the Markdown.

**Expected Output**: Polished infrastructure Jira ticket with Title, Description, AC list, Implementation Plan, Risks, Tags, References.

---

## 7. Prompt: Initial Terraform Draft

**Demonstrator Action**: Paste draft prompt; let output complete; confirm all listed files appear; mention deferred items if any.
Generate baseline code using prompt in `docs/demo-1/prompts/03-initial-terraform-draft.md`.
**Expected Output**: Terraform file blocks matching requested structure with initial resource scaffolding and minimal variables.

---

## 8. Prompt: Add GitHub Actions Pipeline

**Demonstrator Action**: Request pipeline; verify plan/apply separation; highlight secrets usage not plaintext creds.
See pipeline prompt: `docs/demo-1/prompts/04-github-actions-pipeline.md`.
**Expected Output**: One workflow YAML showing jobs/steps: checkout, setup Terraform, init, validate, plan (artifact/comment), gated apply.

---

## 9. Prompt: Best Practice Refinement (Tags & Governance)

**Demonstrator Action**: Run refinement; scan resources for centralized tag map usage; call out governance alignment.
Refinement prompt stored in `docs/demo-1/prompts/05-best-practice-refinement-tags.md`.
**Expected Output**: Modified resource blocks with standardized tag map usage; no untagged resources remain.

---

## 10. Prompt: Variables Everywhere

**Demonstrator Action**: Execute; verify CIDRs, names, scaling thresholds replaced by variables with descriptions.
Variables expansion prompt: `docs/demo-1/prompts/06-variables-everywhere.md`.
**Expected Output**: Expanded variables file plus updated resource references using variables and possibly locals for computed names.

---

### 11. Deployment and Verification (Wrap Up)

**Demonstrator Action:** Conclude the demo by summarizing the total time saved. This is the final impact statement. On this step pipeline could be triggered.
