You are a senior DevOps engineer and Terraform expert.
Your task is to generate a complete, production-grade Terraform codebase based on previous design for the following infrastructure: Azure

Requirements:

Architecture & Structure
- Use a modular Terraform structure
- Separate modules for networking, compute, storage, security, and IAM
- Root module should orchestrate all child modules
- Follow official Terraform best practices
- Use meaningful file and folder organization

Environment Separation
- Support dev, staging, and prod environments
- Use separate tfvars per environment
- Ensure environments are fully isolated
- No hardcoded values

Remote State Management
- Implement a remote backend (S3 + DynamoDB locking)
- Backend must be configurable per environment

Code Quality
- Use variables with type constraints and validation rules
- Use outputs where appropriate
- Use data sources instead of hardcoding resource references
- Add detailed comments explaining design decisions
- Follow least-privilege IAM principles
- All resources must include standardized tags:
  - Project
  - Environment
  - Owner
  - ManagedBy = Terraform

Security & IAM
- Create minimal IAM policies
- Avoid wildcard permissions
- Use IAM roles instead of users where possible

Modules:
- modules/network
- modules/compute
- modules/storage
- modules/iam
- modules/security

Environment folders:
- envs/dev
- envs/staging
- envs/prod

Each module must contain:
- main.tf
- variables.tf
- outputs.tf
- README.md explaining the module

README
Generate a top-level README with:
- Architecture overview
- Folder structure explanation
- Step-by-step deployment instructions
- Example terraform commands for each environment

Best Practices
- Use for_each instead of count
- Avoid hardcoded ARNs
- Use locals where appropriate
- Prefer data blocks
- Use explicit depends_on only when necessary

Output the code as if this is a real production repository.
Do NOT skip any files.
Do NOT simplify.
_____________________________________________________________________________________

