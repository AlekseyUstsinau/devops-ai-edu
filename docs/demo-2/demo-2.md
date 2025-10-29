
﻿# Demo 2 Walkthrough: Post-Provision Hardening, Optimization & Analysis

## 1. Purpose
Show how after baseline infra + app deployment we can leverage an LLM co‑pilot to accelerate:
1. Foundational best practices hygiene.
2. Security & observability hardening.
3. Cost (FinOps) optimization & autoscaling.
4. Logging / incident triage & communication.
5. Multi‑cloud translation (AWS → Azure skeleton).

**Expected Output**: Audience sees repeatable pattern: direct action prompts → minimal diffs → measurable impact (no ticket creation phase).

---

## 2. Scenario Overview
Pre‑existing state (from Demo 1):
- Terraform-managed AWS stack (VPC, ECS Fargate service, ALB, ECR, IAM roles, CloudWatch Logs, tagging baseline, GitHub Actions CI/CD).
- Deployed static site container behind ALB.

New improvement tracks (cases):
1. Foundational Best Practices.
2. Security & Observability Hardening.
3. FinOps / Cost & Resource Efficiency (with Autoscaling).
4. Logging Investigation & Postmortem Acceleration.
5. AWS → Azure Terraform Converter (strategic portability).

Each case now follows a compressed loop (no Q&A or ticket phase): Context → Direct Action Prompt → Impact Summary.

---

## 3. Case 1: Foundational Best Practices

### 3.1 Context
Baseline deployment exists; need hygiene: tagging consistency, variable exposure, retention normalization, workflow pinning, Docker hygiene — without expanding scope.

### 3.2 Direct Best-Practices Action
Prompt: `docs/demo-2/prompts/01-best-practices.md` — instructs LLM to output gaps & diffs (Terraform, GitHub Actions, Dockerfile) plus optional gated additions.
**Expected Output**: Inventory, Recommended Terraform Changes, GitHub Actions Changes, Dockerfile Changes, Optional Additions, Tagging Matrix, Consolidated Diff, Rationale.

### 3.3 Impact Summary
Focus: improved consistency, reduced latent risk, groundwork for deeper security & FinOps.

---

## 4. Case 2: Security & Observability Hardening

### 3.1 Context
We have a functional deployment but minimal guardrails: broad IAM policies, default log retention, incomplete tagging consistency, no explicit supply chain hardening.

### 3.2 Direct Hardening Action
Prompt: `docs/demo-2/prompts/02-security-hardening.md` — instructs LLM to immediately output hardened diffs (Terraform + GitHub Actions) with rationale.
**Expected Output**: Sections: Terraform Changes, GitHub Actions Changes, Rationale.

### 3.3 Impact Summary
Summarize reduced attack surface + improved traceability (e.g., retention standardized, least privilege applied, supply chain pinned).

---

## 5. Case 3: FinOps / Resource Efficiency & Autoscaling

### 4.1 Context
Current infra sized for demo, may contain overprovisioned or idle components, unnecessary retention, unconditional pipeline runs.

### 4.2 Direct Optimization Action
Prompt: `docs/demo-2/prompts/03-finops-optimization.md` — generates optimization table, autoscaling proposal & diffs directly.
**Expected Output**: Optimization Table, Autoscaling Proposal, Terraform & Workflow changes, Summary.

### 4.3 Impact Summary
Show before / after (qualitative) and highlight any approximate cost delta (even if illustrative for demo).

---

## 6. Case 4: Logging Investigation & Incident Communication

### 5.1 Context
Intermittent 5xx spikes + elevated latency observed; raw log samples + sparse metrics available.

### 5.2 Direct Analysis
Prompt: `docs/demo-2/prompts/04-logging-analysis.md` — paste representative logs & metrics with this prompt.
**Expected Output**: Pattern Summary, Root Causes, Remediation, Preventive Actions, Postmortem Draft, Alert Template.

### 5.3 Impact Summary
Demonstrate acceleration of incident triage & communication pack generation.

---

## 7. Case 5: AWS → Azure Terraform Converter

### 6.1 Context
Need a portability story: show how LLM jumpstarts cross-cloud translation for stakeholder evaluation.

### 6.2 Direct Conversion Prompt
Prompt: `docs/demo-2/prompts/05-infra-converter.md`.
**Expected Output**: Mapping table + Azure skeleton file list + sample resource blocks.

### 6.3 (Optional) Refinement
Ask for parameterization improvements or tagging alignment after initial skeleton.

### 6.4 Impact Summary
Explain strategic value: faster feasibility assessment for multi-cloud without full manual groundwork.

---

## 8. Cross-Case Pattern (Teaching Point)
New accelerated pattern (no clarification & no tickets):
1. Direct Action Prompt → 2. Diff Review → 3. Impact Summary.
Emphasize: reduced latency from requirement to actionable changes; consistency via standardized prompt templates; ticketing can be reintroduced later if governance requires.

---

## 9. Final Wrap-Up
Deliver unified impact statement:
“Starting from a running baseline, we produced hardening, cost optimization, incident analysis assets, and a multi‑cloud translation skeleton in <X> minutes with LLM assist—reducing manual exploratory overhead by ~Y%.”

Highlight next evolution:
- Phase 2: Add TLS + WAF + automated image scanning.
- Phase 3: Advanced autoscaling policies & anomaly detection.
- Phase 4: Policy-as-code guardrails (OPA / tfsec integrated prompts).

---

## 10. Prompt Index (Demo 2 Active Prompts)
| #  | Purpose                                   | File                                               |
|----|-------------------------------------------|----------------------------------------------------|
| 01 | Foundational best practices               | `docs/demo-2/prompts/01-best-practices.md`         |
| 02 | Security & observability hardening        | `docs/demo-2/prompts/02-security-hardening.md`     |
| 03 | FinOps optimization & autoscaling         | `docs/demo-2/prompts/03-finops-optimization.md`    |
| 04 | Logging & incident analysis               | `docs/demo-2/prompts/04-logging-analysis.md`       |
| 05 | AWS→Azure infra converter                 | `docs/demo-2/prompts/05-infra-converter.md`        |

---

### Live Tips
- Keep audience engaged by asking: “What would you normally do manually first?” before each clarification prompt.
- Time-box clarifications (30–45s theme) to stress speed.
- After each diff, verbally map change → risk reduced or cost saved.
- Reiterate not adding out-of-scope services: discipline is part of the value.

### Metrics to Capture During Demo (Optional)
- Number of prompts vs manual steps saved.
- Approx. minutes per case.
- Count of changed Terraform lines.
- Potential monthly cost delta (even if approximate for storytelling).

----
Steps 1,2,3,5 tooks 80 min on dry-run demo on cloude sonnet 4.5 model