# Step 14: Infrastructure Cleanup & Lessons Learned

## Context
You have successfully completed the corporate website infrastructure deployment demo. All AWS resources are currently running and incurring costs. You need to clean up the infrastructure to avoid ongoing charges while documenting lessons learned for future reference.

## Current State
- ECS Fargate service running in private subnets
- Application Load Balancer distributing traffic
- ECR repository containing container images
- VPC with endpoints for cost optimization
- CloudWatch logs and monitoring active
- All resources deployed via Terraform with state management

## Request
Please help me clean up all the AWS infrastructure we created during this demo to avoid ongoing costs.

## Requirements
1. **Complete Infrastructure Cleanup**
   - Destroy all Terraform-managed resources
   - Verify no resources remain that could incur costs
   - Check for ECR repositories in different AWS regions
   - Ensure clean state for future experiments

2. **Multi-Region Verification**
   - Check current configured AWS region
   - Verify ECR repositories in commonly used regions (us-east-1, us-west-2)
   - Clean up any orphaned resources

3. **State Management & S3 Backend Cleanup**
   - Remove Terraform state bucket used for backend storage
   - Guidance on whether to preserve local Terraform state files
   - Local cleanup recommendations
   - Preparation for future infrastructure experiments

## Expected Deliverables
- Step-by-step cleanup commands for PowerShell
- S3 backend bucket deletion steps
- Verification steps to confirm complete cleanup
- Troubleshooting guidance for common cleanup issues

## Context Notes
- Using AWS CLI with configured profile
- Terraform state stored locally in terraform directory
- Project variables defined in terraform.tfvars file
- Resources follow standard naming pattern with project and environment prefixes

Please provide the complete cleanup procedure with verification steps.