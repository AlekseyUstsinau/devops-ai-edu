# Prompt 10: App Build & Deploy GitHub Actions Pipeline

ROLE: CI/CD Engineer.
TASK: Create GitHub Actions workflow yaml to build & deploy app.
NAME: main.yml
TRIGGERS: manual workflow_dispatch.
JOBS:
- build_and_push: build image, login ECR, push (tags: sha, 'latest').
- terraform_plan: runs on PR & main pushes (depends on build), executes terraform inside terraform/ root, outputs plan artifact.
- terraform_apply: runs only on manual approval + push to main (environment protection) or workflow_dispatch; executes terraform apply in terraform/ root.
CONSTRAINTS:
- Use AWS creds via secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION.
- Cache Terraform plugins & modules.
- Post plan summary as PR comment.
- Fail fast on lint (optional step) for Dockerfile.
- Ensure plan/apply restricted to app-related changes (optionally detect path filter: app/** OR terraform/*ecs-*app* files).
OUTPUT: Single YAML.
