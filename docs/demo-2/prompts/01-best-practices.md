# Prompt 01: Foundational Best Practices Pass
ROLE: Platform Engineer.
OBJECTIVE: Apply foundational best practices to ONLY existing Terraform resources, GitHub Actions workflows, and Docker image. Do NOT add new AWS services. If you believe a new service would help, list it under Optional Additions with a YES/NO gate (default NO) instead of adding.

SCOPE AREAS:
1. Terraform Hygiene:
   - Normalize & enforce tagging (merge default tags + ensure Component/Owner/Environment).
   - Standardize log retention (e.g. 30 days) via variable if missing.
   - Expose hard-coded values (retention, cpu/memory, desired_count) as variables.
   - Add missing outputs for critical IDs (if helpful downstream).
   - Reduce overly broad IAM policy statements (only if clearly safe; otherwise leave for Security Pass).
2. GitHub Actions:
   - Add/adjust caching (actions/cache) & path filters to skip unnecessary runs.
   - Restrict workflow permissions to least privilege for each job.
   - Pin all actions to version or SHA.
   - Ensure artifact retention days is set explicitly (short for demo).
3. Docker Image:
   - Multi-stage build suggestion (if not present) for smaller runtime layer.
   - Non-root user enforcement.
   - Pin base image version.
   - Add optional (commented) security scan step reference.
4. Observability Basics:
   - Ensure essential log groups retention set (no new services; placeholders allowed as comments for metrics/alerts).

OUTPUT SECTIONS (use exact headers below, no extra commentary outside them):
## Inventory (Current vs Target)
List concise tables per area summarizing gaps.

## Recommended Terraform Changes
Only changed/added blocks (no full file spam). Use HCL; include variable definitions if newly introduced.

## GitHub Actions Changes
Job snippets / permissions & caching adjustments only.

## Dockerfile Changes
Show diff-style or replacement snippets.

## Optional Additions (YES/NO Gates)
Bullet list of potential improvements (default NO). Example: WAF (NO), Image scanning step (YES), etc.

## Tagging Matrix
| Resource Type | Required Tags Present | Missing Tags | Action |

## Consolidated Diff
Unified minimal diff (Terraform + workflows + Docker) deduplicated.

## Rationale
Bullet list mapping Change -> Benefit.

CONSTRAINTS:
- No creation of new AWS services.
- Keep changes minimal & foundational; deeper security reserved for next pass.
- Avoid repeating identical blocks in multiple sections.
