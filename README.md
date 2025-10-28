# DevOps AI Education Demos

Accelerated DevOps workflows using Large Language Models (LLMs) as a co‑pilot. This repository contains two progressive demo tracks that showcase moving from vague business input → structured tickets → infrastructure & application code → post‑provision hardening, optimization, and cross‑cloud translation.

## 🎯 Core Goals
- Demonstrate prompt design patterns for infra + app delivery.
- Show iterative refinement (questions → tickets → code → best practices → optimization).
- Teach evaluation of AI output (diff review, governance, tagging consistency, security posture).
- Provide reusable prompt files as templates.

## 🚀 Demo Overview

### Demo 0 (Preparation)
Establish minimal instruction files for the AI agent (`.github/instructions/terraform.instruction.md` and `.github/instructions/jira.instruction.md`) plus connect MCP GitHub server. Defines allowed actions, restrictions, and context the agent can leverage.

### Demo 1 (From Vague Email to Infra + App Deployment)
Two walkthroughs:
1. Infrastructure: transform an unstructured email into clarification Q&A blocks → Jira-style ticket → initial Terraform → GitHub Actions workflow → best practice & variables/governance refinements.
2. Application: separate clarification cycle for app deployment (Docker + ECS service) reusing infra state; add CI/CD, security hardening, autoscaling variables, governance tagging.

Emphasis: structured prompts, iterative improvement, minimal manual editing. Output includes Terraform scaffolding, workflows, tickets, and refinement steps.

### Demo 2 (Post-Provision Improvement Loop)
Focus shifts to direct action prompts (no Q&A/ticket phase). Five cases:
1. Foundational best practices hygiene.
2. Security & observability hardening.
3. FinOps optimization & autoscaling proposals.
4. Logging analysis & incident communication acceleration.
5. AWS → Azure Terraform conversion skeleton.

Pattern: Context → Direct Action Prompt → Diff Review → Impact Summary. Teaches rapid incremental enhancement and portability.

## 📁 Repository Structure
```
docs/
  demo-1/               # Demo 0 + Demo 1 walkthrough & prompt assets
    00-demo-0-prep-walkthrough-en.md
    01-demo-1-infra-walkthrough-en.md
    02-demo-1-app-build-deploy-walkthrough-en.md
    files/              # Static site sample (index.html)
    prompts/            # Prompt templates (clarification, tickets, code, refinement)
  demo-2/               # Demo 2 improvement tracks
    demo-2.md           # Master walkthrough for hardening & optimization cases
    prompts/            # Direct action prompt templates for each case
.github/
  instructions/         # (To be added) AI instruction files for Terraform & Jira
```

## 🧠 Prompt Categories (Demo 1)
- Clarification: gather missing parameters (architecture, security, scalability, observability, compliance, delivery).
- Ticket Generation: produce structured Jira/GitHub issue with AC, implementation plan, risks, tags.
- Initial Code: Terraform or Docker + ECS incremental blocks.
- Pipeline: GitHub Actions workflows (plan/apply separation, artifact retention).
- Refinement: best practices (tags), variables expansion, security adjustments, governance consistency.

## 🔄 Demo 1 Flow Summary
1. Read vague email aloud → identify gaps.
2. Run clarification prompt blocks → capture structured answers.
3. Generate infra ticket → (optionally create Jira/GitHub issue).
4. Generate initial Terraform → review scaffold vs expectations.
5. Add CI/CD pipeline → verify separation of plan/apply & secret usage.
6. Apply best practice refinements (tags, variables, governance, security, autoscaling) via successive prompts.
7. Summarize time saved & impact.

## ♻️ Demo 2 Case Pattern
For each improvement case:
1. Provide context snippet.
2. Paste corresponding direct action prompt.
3. Review AI-proposed diff (Terraform, workflows, Docker). Validate least privilege, tagging, cost impact.
4. Capture concise impact summary (risk reduced, cost optimized, operational clarity).

## 🛡️ Governance & Best Practices Highlights
- Tagging consistency via centralized map/local.
- Variables for all mutable parameters (CIDRs, scaling thresholds, names).
- Separation of planning vs applying infra changes.
- Security hardening: IAM least privilege, Docker USER directive, log retention normalization, supply chain pinning.
- Cost awareness: autoscaling policies, resource sizing rationalization.
- Portability: initial AWS→Azure mapping for feasibility.

## ✅ Evaluation Checklist (Adaptable)
Use during demos to validate AI output:
- Are all resources tagged consistently?
- Any hardcoded values that should be variables?
- Pipeline steps separated and gated? (plan vs apply)
- Secrets referenced properly (no plaintext credentials)?
- IAM policies scoped minimally?
- Autoscaling thresholds explained?
- Diff matches requested file structure (no duplicate providers/backends)?
- Logs retention standardized? (e.g., X days)
- No out-of-scope services introduced.

## 🧩 Extending the Demos
Ideas for future phases:
- Add TLS termination + WAF on ALB.
- Integrate image scanning (Trivy/Grype) in CI.
- Introduce policy-as-code (OPA / tfsec) prompt refinement loop.
- Implement anomaly detection & advanced autoscaling.
- Parameter store / secrets management integration (SSM, Secrets Manager).

## 🤖 Using an AI Agent Effectively
1. Provide minimal instruction files with scope & allowed actions.
2. Keep prompts structured and explicit about output formatting (diffs, tables, sections).
3. Iterate quickly: treat AI output as a proposal; review for correctness & governance.
4. Maintain a running answer sheet during clarification phases for clean ticket generation.
5. Time-box interactions to highlight acceleration vs manual workflows.

## 📌 Contributing
1. Fork or branch from `docs` branch.
2. Add new prompt templates under appropriate `docs/demo-X/prompts/` folder.
3. Update this README if adding a new demo track or category.
4. Keep Markdown clear; prefer consistent heading levels.
5. Avoid committing generated secrets or proprietary configuration.

## 📝 License
Add a license file (e.g., MIT) if external sharing is intended. Currently unspecified.

## 🔍 Quick Start (Minimal)
1. Create `.github/instructions/terraform.instruction.md` and `.github/instructions/jira.instruction.md` with project context & allowed actions.
2. Connect GitHub MCP server in IDE (enables issue & repo operations).
3. Follow Demo 1 walkthrough markdown files step by step.
4. Proceed to Demo 2 for improvement loops.

---
Impact Statement Template:
"Using the LLM we converted a vague email into production-ready infra & app deployment (Terraform + CI/CD + refinements) in <X> minutes vs <Y> manually; subsequent hardening & optimization delivered <Z> qualitative improvements rapidly."
