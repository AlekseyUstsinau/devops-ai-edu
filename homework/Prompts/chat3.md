You are a senior DevOps engineer designing CI/CD for Terraform infrastructure.

Your goal is to create a production-grade GitHub Actions pipeline that manages Terraform for Azure infrastructure.

REQUIREMENTS

Pipeline capabilities
- Automatically run `terraform fmt` and `terraform validate`
- Automatically run `terraform plan` on Pull Requests
- Automatically run `terraform apply` when PR is merged to main
- Use environment variables and GitHub Secrets correctly

Security and quality gates
- Add Terraform security scanning using tfsec or checkov
- Fail the pipeline if security issues are found
- Ensure formatting and validation must pass before plan/apply

Notifications
- Send Slack or email notification on:
  - Plan success/failure
  - Apply success/failure

Best practices
- Clear separation between plan and apply jobs
- Prevent apply on PR (only after merge to main)

DELIVER EXACTLY THE FOLLOWING:
- Folder structure of the repository
- Required GitHub secrets and variables
- Complete GitHub Actions YAML workflow file
- Explanation of each job in the workflow
- Example IAM role policy for GitHub OIDC access
- How notifications are configured
- How to extend this for multiple environments

Be opinionated. Provide concrete YAML and Terraform code. Do not give multiple alternatives.
Output must be ready to copy into a real repository.

____________________________________

Now refactor this workflow into reusable workflows and environment-specific workflow files (staging.yml, prod.yml).


