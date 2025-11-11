# Prompt 02: Security & Observability Hardening Pass

## Context
You are a Security & Observability Engineer reviewing an AWS infrastructure codebase. Foundational best practices have ALREADY been applied. This pass focuses on **security hardening and observability enhancements**.

## Objective
**MODIFY THE ACTUAL FILES** to implement security improvements - do not just describe changes. Do NOT add new AWS services without explicit approval.

## Scope Areas

### 1. IAM Security Hardening
- Apply least privilege to IAM roles (ECS task execution/task roles)
- Remove overly broad permissions (`*` actions, `*` resources)
- Add condition keys (e.g., `aws:RequestedRegion`, `aws:SecureTransport`)
- Ensure service-specific policies instead of admin access

### 2. GitHub Actions Security
- Enforce least privilege OIDC permissions for AWS access
- Add container image security scanning steps
- Implement secret scanning checks
- Add SAST where applicable
- Ensure all sensitive values use GitHub Secrets

### 3. Container Security
- Scan Docker images for vulnerabilities (add scanning or comments)
- Ensure non-root user is enforced
- Minimize attack surface (remove unnecessary packages)
- Implement read-only root filesystem where possible

### 4. Network Security
- Tighten security group rules to minimum required ports
- Add descriptions to all security group rules
- Add VPC flow logs comment if missing

### 5. Observability Enhancements
- Standardize CloudWatch log retention (30 days)
- Add missing CloudWatch log groups
- Add placeholder CloudWatch alarms (as comments) for:
  - High CPU/Memory usage, HTTP 5xx errors, Failed health checks

### 6. Data Protection
- Ensure encryption at rest for all data stores
- Ensure encryption in transit (HTTPS only)
- Add comments for KMS key rotation policies

## Expected Actions

**YOU MUST:**
1. **Read all files** in .github/workflows/, terraform/, and app/ directories
2. **Identify security gaps** and weak configurations
3. **Modify the actual files** to apply security hardening
4. **Focus on incremental changes** beyond best practices pass

**DO NOT:**
- Only provide diffs or suggestions - actually edit the files
- Add new AWS services without approval
- Break existing functionality

## Output Format

After modifications, provide a summary report:

### 1. Security Changes Applied
| File | Security Change | Risk Mitigated |

### 2. Security Hardening Summary
- **IAM**: [least privilege improvements]
- **Network**: [security group hardening]
- **Container**: [Docker security enhancements]
- **GitHub Actions**: [CI/CD security improvements]
- **Data Protection**: [encryption and data security]
- **Observability**: [logging and monitoring improvements]

### 3. Remaining Security Gaps (Optional - Default NO)
- [ ] AWS WAF for ALB
- [ ] AWS GuardDuty
- [ ] AWS Config rules
- [ ] KMS custom keys
- [ ] VPC Flow Logs
- [ ] AWS Security Hub

### 4. Compliance Notes
Brief notes on compliance standards addressed (e.g., CIS AWS Foundations, NIST, SOC2)

## Constraints
- **No new AWS services** without explicit approval
- Focus on hardening existing resources
- Maintain backward compatibility
- Preserve existing functionality while improving security posture
