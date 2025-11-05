# Prompt 00: Terraform Backend Setup

ROLE: Infrastructure Setup Engineer.
TASK: Verify and setup Terraform S3 backend infrastructure before proceeding with main Terraform code.

PREREQUISITES: Ensure user has completed setup from ../PREREQUISITES.md (AWS CLI, Terraform, credentials configured).

🔒 **SECURITY CHECK**: Verify .gitignore file exists with Terraform exclusions before any backend setup!

PREREQUISITES CHECK:
1. Confirm .gitignore file includes Terraform state files (*.tfstate, .terraform/, etc.)
2. Ask user for S3 bucket name for Terraform state storage
3. Ask user for preferred AWS region for backend resources
4. Ask user for DynamoDB table name for state locking (suggest: terraform-state-lock)
5. Check if the S3 bucket and DynamoDB table exist using AWS CLI
6. If resources don't exist, provide creation commands

BACKEND SETUP REQUIREMENTS:
- S3 bucket with versioning enabled
- Server-side encryption (AES256)
- Public access blocked
- DynamoDB table for state locking
- Consistent region for all backend resources

VERIFICATION STEPS:
- Confirm bucket and DynamoDB table creation
- Test terraform init with backend configuration
- Verify state file is stored in S3 with proper encryption

CONSTRAINTS:
- Use consistent naming convention for bucket
- Enable versioning and encryption for S3
- Block all public access on S3 bucket
- Create DynamoDB table in same region as S3 bucket
- Use minimal provisioned capacity for DynamoDB (1 read, 1 write)

OUTPUT: 
- Step-by-step AWS CLI commands for resource creation (if needed)
- Backend configuration block for terraform
- Verification commands to confirm setup