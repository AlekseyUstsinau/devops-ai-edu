# Homework Task: From Vague Request to Working Infrastructure

## Overview

This assignment demonstrates how to use AI tools (LLMs and GitHub Copilot) to transform a vague business request into production-ready infrastructure code, complete with CI/CD pipelines and documentation.

---

## Business Request

The following email represents the initial requirement:

```
Subject: Quick staging environment for a simple service

Hi team,

We need to quickly stand up a temporary staging environment for a small service. 
It must be highly available and support horizontal scaling. Keep costs low (use 
free tier where possible) and implement an automatic stop during nights to save 
money. This is for short-lived testing and should be easy to tear down.

Please provision infrastructure in AWS and add a CI/CD pipeline that can deploy 
updates. Prioritize reliability and low cost.

Thanks,
Manager
```

---

## Objectives

Your goal is to create a complete solution that includes:

1. **Infrastructure as Code**: Use Terraform to provision AWS resources including:
   - Application Load Balancer (ALB) for high availability
   - Auto Scaling Group (ASG) with EC2 instances for horizontal scaling
   - Security groups with proper access controls
   - Launch template with user-data script to install and run a web service (e.g., Nginx)

2. **CI/CD Pipeline**: Implement a GitHub Actions workflow that:
   - Deploys infrastructure changes using Terraform
   - Deploys application updates to EC2 instances via SSH
   - Uses GitHub Secrets for secure credential management

3. **Documentation**: Provide clear documentation showing:
   - The LLM prompts used at each iteration
   - Architecture diagram of the deployed solution

---

## Technical Requirements

### Infrastructure Stack
- **IaC Tool**: Terraform (required)
- **Cloud Provider**: AWS
- **Compute**: EC2 instances in Auto Scaling Group (do NOT use ECS, EKS, or other container platforms)
- **Load Balancing**: Application Load Balancer
- **Instance Types**: Free-tier eligible sizes (t2.micro or t3.micro)
- **Web Server**: Simple static web server (e.g., Nginx serving a test page)

### CI/CD Stack
- **Pipeline**: GitHub Actions
- **Deployment Method**: SSH-based (or any other) deployment to EC2 instances
- **Secrets Management**: GitHub Secrets for sensitive values

### Configuration Values

Any configuration parameters required to complete a task, but not explicitly specified in it, are set by the user independently based on their own ideas.


**Important**: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are already configured as GitHub Secrets in this repository. Do NOT hard-code credentials in your code. Use Terraform variables and GitHub Secrets for all sensitive values.

---

## Deliverables

Create the following files and directories in your repository:

```
docs/demo-1-hw/
├── 01_business_request.md          # Copy of the original email
├── 02_impact_summary.md            # Summary with optimizations and security notes
└── prompts/
    └── <descriptive-name>.md       # Each prompt used during development

terraform/
├── main.tf                         # Main Terraform configuration
├── variables.tf                    # Input variables
├── outputs.tf                      # Output values
├── <additional>.tf                 # Other Terraform files as needed
└── files/
    └── startup.sh                  # EC2 user-data script

.github/
└── workflows/
    └── terraform.yaml              # GitHub Actions workflow for deployment
```

---

## Deployment and Cleanup

### Deployment Options

You can provision infrastructure in two ways:

1. **Local Deployment**:
   ```bash
   cd terraform
   terraform init
   terraform plan -var-file="terraform.tfvars"
   terraform apply -var-file="terraform.tfvars"
   ```

2. **GitHub Actions Deployment**:
   - Push changes and manualy trigger the workflow
   - Workflow will run Terraform and deploy application updates

### Mandatory Cleanup

**CRITICAL**: You must destroy all AWS resources when finished to avoid unexpected charges.

Include clear teardown instructions in your documentation:
```bash
terraform destroy -var-file="terraform.tfvars"
```

Or create a GitHub Actions workflow job for cleanup. Verify in AWS Console that no resources remain.

---

## Acceptance Criteria

Your solution must meet the following requirements:

### Infrastructure
- [ ] `terraform plan` executes without errors
- [ ] Plan includes ALB, target group, ASG, launch template, and security groups
- [ ] EC2 user-data successfully installs and starts the web server
- [ ] Web service is accessible through the ALB DNS name
- [ ] Infrastructure spans multiple availability zones for high availability

### CI/CD
- [ ] GitHub Actions workflow runs successfully
- [ ] Workflow can deploy infrastructure using Terraform
- [ ] Workflow can connect to EC2 instances via SSH
- [ ] Application updates can be deployed through the pipeline

### Documentation
- [ ] Original business request is documented
- [ ] All LLM prompts and iterations are saved in `prompts/` directory
- [ ] Architecture diagram clearly shows the infrastructure components
- [ ] Impact summary includes at least 3 cost optimization suggestions
- [ ] Impact summary includes at least 3 security improvement recommendations
- [ ] Teardown instructions are documented

### Code Quality
- [ ] No credentials or secrets are hard-coded in the repository
- [ ] All sensitive values use Terraform variables or GitHub Secrets
- [ ] Code is reproducible and can be run by reviewers
- [ ] Implementation uses free-tier eligible resources where possible

---

## Constraints

- Must use Terraform for infrastructure as code
- Must use EC2 with Auto Scaling Group (container platforms not allowed)
- Must use GitHub Actions for CI/CD
- Must implement SSH-based deployment
- Must be cost-effective (free-tier friendly)
- Must be easy to tear down completely

---

## Success Criteria

A successful submission allows a reviewer to:

1. Run `terraform init` and `terraform plan` successfully (after providing their own variable values)
2. See a clear architecture that matches the business requirements
3. Understand the thought process through documented prompts and iterations
4. Deploy application updates using the GitHub Actions workflow
5. Completely tear down all resources without leaving any orphaned infrastructure

---

## Getting Started

1. Read the business request carefully
2. Use LLMs to clarify requirements and generate architecture proposals
3. Document each prompt and the AI's response
4. Iteratively refine the infrastructure and deployment code
5. Test locally before committing
6. Verify the GitHub Actions workflow runs successfully
7. Document optimizations and security improvements
8. Clean up all resources
