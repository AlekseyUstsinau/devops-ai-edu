# Prompt 04: GitHub Actions Terraform Pipeline

ROLE: CI/CD Engineer.
TASK: Generate GitHub Actions workflow (YAML) for Terraform validation pipeline: init, format check, validate, security scan (tfsec), and plan in terraform/ directory.
CONSTRAINTS:
- Pipeline should NOT include apply step (validation only).
- Use terraform fmt -check to verify formatting.
- Include tfsec security scanning step.
- Pass AWS credentials via GitHub Secrets with engineer-specific variable names (e.g., SSVERCHKOV_AWS_ACCESS_KEY_ID).
- Ask user for their specific AWS credential variable names to support multiple engineers.
- Cache Terraform plugins for speed.
- Check if S3 backend bucket exists, provide creation steps if needed.
OUTPUT: Single YAML file.
.github/workflows/terraform-validate.yaml
