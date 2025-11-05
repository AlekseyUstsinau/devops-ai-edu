# Demo 1: Corporate Website Infrastructure Deployment

This demo walks through the complete process of deploying a corporate website infrastructure on AWS using Infrastructure as Code (IaC) principles.

## 🚀 Quick Start

### 1. **Prerequisites Setup** 
**⚠️ IMPORTANT: Complete this first!**

Before using any prompts, ensure you have completed the setup described in:
📋 **[PREREQUISITES.md](./PREREQUISITES.md)**

This includes:
- **🔒 CRITICAL FIRST STEP**: Create .gitignore file (prevents committing secrets)
- AWS CLI + Python installation and configuration
- Terraform installation
- GitHub CLI (optional)
- AWS credentials configuration
- Git setup

### 2. **Prompt Workflow**

Follow the prompts in numerical order:

#### **Infrastructure Setup Phase**
1. **[00-backend-setup.md](./prompts/00-backend-setup.md)** - Verify/create S3 backend infrastructure
2. **[01-clarification-questions.md](./prompts/01-clarification-questions.md)** - Gather requirements
3. **[02-generate-jira-ticket.md](./prompts/02-generate-jira-ticket.md)** - Create structured ticket
4. **[03-initial-terraform-draft.md](./prompts/03-initial-terraform-draft.md)** - Generate initial Terraform code
5. **[04-github-actions-pipeline.md](./prompts/04-github-actions-pipeline.md)** - Create validation pipeline
6. **[05-best-practice-refinement-tags.md](./prompts/05-best-practice-refinement-tags.md)** - Apply best practices
7. **[06-variables-everywhere.md](./prompts/06-variables-everywhere.md)** - Parameterize configuration

#### **Application Deployment Phase**
8. **[07-app-clarification-questions.md](./prompts/07-app-clarification-questions.md)** - App requirements
9. **[08-generate-app-ticket.md](./prompts/08-generate-app-ticket.md)** - App development ticket
10. **[09-initial-app-code.md](./prompts/09-initial-app-code.md)** - Create application code
11. **[10-app-cicd-pipeline.md](./prompts/10-app-cicd-pipeline.md)** - Application CI/CD pipeline
12. **[11-app-security-refinement.md](./prompts/11-app-security-refinement.md)** - Security hardening
13. **[12-app-variables-autoscaling.md](./prompts/12-app-variables-autoscaling.md)** - Variable expansion & autoscaling
14. **[13-app-governance-tags.md](./prompts/13-app-governance-tags.md)** - Tag governance

## 🎯 Learning Objectives

By completing this demo, you will learn:

- **Infrastructure as Code (IaC)** with Terraform
- **AWS services integration** (ECS, ECR, ALB, VPC)
- **CI/CD pipeline creation** with GitHub Actions
- **Security best practices** for containerized applications
- **Cost optimization** strategies (VPC endpoints vs NAT Gateway)
- **Multi-engineer collaboration** patterns
- **Terraform state management** with S3 backend
- **Container security** with non-root users
- **Autoscaling configuration** for production workloads
- **Resource tagging** and governance

## 📋 Architecture Overview

The final infrastructure includes:

- **VPC** with public/private subnets across 2 AZs
- **Application Load Balancer** in public subnets
- **ECS Fargate** service in private subnets
- **ECR** repository for container images
- **VPC Endpoints** for cost-effective ECR/S3 access
- **CloudWatch** logging and monitoring
- **Autoscaling** based on CPU metrics
- **Security groups** with minimal required access
- **GitHub Actions** CI/CD pipelines

## 🔧 Key Features

- **Cost Optimized**: VPC endpoints (~$22/month) vs NAT Gateway (~$45/month)
- **Security Hardened**: Non-root containers, minimal permissions
- **Production Ready**: Autoscaling, health checks, proper logging
- **Multi-Engineer Support**: Prefixed credential variables
- **Validation Pipeline**: Format check, validate, security scan, plan
- **Deployment Pipeline**: Build, test, deploy with proper approvals

## 🚨 Important Notes

- **Always start with prerequisites** - tools and credentials must be configured first
- **Use engineer-specific credential names** for GitHub Secrets (e.g., `YOURNAME_AWS_ACCESS_KEY_ID`)
- **Verify S3 backend bucket exists** before running Terraform
- **Follow security best practices** - never commit credentials to git
- **Use validation pipeline** for all infrastructure changes
- **Test locally** before deploying to AWS

## 🆘 Troubleshooting

If you encounter issues:

1. **Check prerequisites** - ensure all tools are installed and configured
2. **Verify AWS credentials** - run `aws sts get-caller-identity`
3. **Check Terraform version** - ensure compatibility
4. **Review GitHub Secrets** - ensure correct variable names
5. **Check S3 backend** - verify bucket exists and is accessible

## 📚 Additional Resources

- [AWS ECS Documentation](https://docs.aws.amazon.com/ecs/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Security Best Practices](https://docs.docker.com/develop/security-best-practices/)