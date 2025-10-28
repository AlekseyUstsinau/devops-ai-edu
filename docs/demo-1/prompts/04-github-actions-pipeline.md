# Prompt 04: GitHub Actions Terraform Pipeline

ROLE: CI/CD Engineer.
TASK: Generate GitHub Actions workflow (YAML) to: init, validate, plan, apply Terraform in terraform/ directory.
CONSTRAINTS:
- Use separate jobs or steps for plan vs apply.
- Apply runs only on manual approval or merge to main.
- Pass AWS credentials via GitHub Secrets.
- Cache Terraform plugins for speed.
OUTPUT: Single YAML file.
.github/workflows/terraform.yaml
