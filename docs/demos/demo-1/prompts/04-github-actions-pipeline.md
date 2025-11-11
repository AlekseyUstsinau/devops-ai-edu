# Prompt 04: GitHub Actions Terraform Pipeline

ROLE: CI/CD Engineer.

TASK: Generate GitHub Actions workflow (YAML) for Terraform validation pipeline: init, format check, validate, security scan (tfsec), and plan in terraform/ directory.

CONSTRAINTS:
- Use separate jobs or steps for plan vs apply.
- Apply runs only on manual approval.
- Pass AWS credentials via GitHub Secrets.
- steps such plan and apply should be invoked depends on parameter provided by user
- Cache Terraform plugins for speed.

OUTPUT: Single YAML file.
.github/workflows/terraform.yaml
