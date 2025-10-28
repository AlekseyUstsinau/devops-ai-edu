# Prompt 02: Security & Observability Hardening Pass
ROLE: Security & Observability Engineer.
CONTEXT: Foundational best-practices (tag normalization, variable exposure, basic Docker hygiene, workflow pinning/caching) have ALREADY been applied in a prior pass.
TASK: Apply deeper security & observability hardening to existing Terraform + GitHub Actions WITHOUT extra clarification.
INCLUDE CHANGES FOR (focus on incremental deltas beyond best practices):
- IAM least privilege (execution/task roles / workflow permissions).
- Log retention standardization (30 days default) & missing outputs for key IDs.
- Supply chain: pin GitHub Actions with SHAs or exact versions.
- Add lightweight image scan step (note if simulated).
- Enforce tagging (merge(var.default_tags, { Component = "Core" })).
- Add minimal alerts or placeholders (commented) for future expansion.
CONSTRAINTS:
- No introduction of new AWS services beyond existing scope.
- Show only ADDED or CHANGED resource and workflow blocks.
OUTPUT FORMAT (exact headers):
Sections:
1. Terraform Changes
2. GitHub Actions Changes
3. Observability Enhancements (log retention adjustments, placeholder alert rules as comments)
4. Rationale (bullet list mapping change -> benefit)
