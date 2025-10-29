# Prompt 01: Foundational Best Practices Pass

## Context
You are a Platform Engineer reviewing an AWS infrastructure codebase with Terraform, GitHub Actions workflows, and a Dockerfile.

## Objective
**MODIFY THE ACTUAL FILES** to apply foundational best practices - do not just describe changes. Do NOT add new AWS services.

## Scope Areas

### 1. Terraform Hygiene
- Normalize & enforce tagging (Component/Owner/Environment)
- Standardize log retention (30 days) via variable
- Expose hard-coded values (retention, cpu/memory, desired_count) as variables
- Add missing outputs for critical IDs
- Reduce overly broad IAM policies (if clearly safe)

### 2. GitHub Actions Best Practices
- Add caching for dependencies and build artifacts
- Add path filters to skip unnecessary runs
- Restrict workflow permissions to least privilege
- Pin all actions to specific versions or commit SHAs
- Set explicit artifact retention days (short for demos)
- Add concurrency controls to prevent redundant runs

### 3. Dockerfile Best Practices
- Implement multi-stage build for smaller runtime layer
- Non-root user enforcement
- Pin base image version
- Add optional (commented) security scan step reference

### 4. Observability Basics
- Ensure log groups have retention set (placeholders allowed as comments for metrics/alerts)

## Expected Actions

**YOU MUST:**
1. **Read all files** in .github/workflows/, terraform/, and app/ directories
2. **Identify gaps** against best practices
3. **Modify the actual files** to apply improvements
4. **Provide a summary report** after making changes

**DO NOT:**
- Only provide diffs or suggestions - actually edit the files
- Add new AWS services without approval

## Output Format

After modifications, provide a summary report:

### 1. Changes Applied
| File | Changes Made | Reason |

### 2. Best Practices Implemented
- **Tagging**: [what was standardized]
- **Variables**: [what was parameterized]
- **Observability**: [what was improved]
- **GitHub Actions**: [what was secured/optimized]
- **Docker**: [what was enhanced]
- **IAM**: [what was tightened]

## Constraints
- **No new AWS services** without explicit approval
- Preserve existing functionality - only enhance configuration
- Maintain compatibility with existing Terraform state
