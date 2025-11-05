# Prompt 00: Terraform Backend Setup

ROLE: Infrastructure Setup Engineer.
TASK: Verify and setup Terraform S3 backend infrastructure before proceeding with main Terraform code.

PREREQUISITES: Ensure user has completed setup from ../PREREQUISITES.md (AWS CLI, Terraform, credentials configured).

🔒 **SECURITY CHECK**: Verify .gitignore file exists with Terraform exclusions before any backend setup!

PREREQUISITES CHECK:
1. Confirm .gitignore file includes Terraform state files (*.tfstate, .terraform/, etc.)
2. Ask user for S3 bucket name for Terraform state storage.
3. Check if the S3 bucket exists using AWS CLI.
4. If bucket doesn't exist, provide creation steps.

BACKEND SETUP STEPS (if bucket doesn't exist):
```bash
# 1. Create S3 bucket for Terraform state
aws s3 mb s3://YOUR-TERRAFORM-STATE-BUCKET --region us-east-1

# 2. Enable versioning
aws s3api put-bucket-versioning \
  --bucket YOUR-TERRAFORM-STATE-BUCKET \
  --versioning-configuration Status=Enabled

# 3. Enable server-side encryption
aws s3api put-bucket-encryption \
  --bucket YOUR-TERRAFORM-STATE-BUCKET \
  --server-side-encryption-configuration '{
    "Rules": [
      {
        "ApplyServerSideEncryptionByDefault": {
          "SSEAlgorithm": "AES256"
        }
      }
    ]
  }'

# 4. Block public access
aws s3api put-public-access-block \
  --bucket YOUR-TERRAFORM-STATE-BUCKET \
  --public-access-block-configuration \
  "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# 5. Create DynamoDB table for state locking
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
  --region us-east-1
```

VERIFICATION:
- Confirm bucket and DynamoDB table creation
- Test terraform init with backend configuration
- Verify state file is stored in S3

CONSTRAINTS:
- Use consistent naming convention for bucket
- Enable versioning and encryption
- Block all public access
- Create DynamoDB table for state locking

OUTPUT: Step-by-step verification and creation commands if needed.