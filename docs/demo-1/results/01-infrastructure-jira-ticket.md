# Infrastructure Jira Ticket

## Title
[STORY] Provision AWS ECS-based Infrastructure for Corporate Website Demo Environment

## Description
Set up a fully automated, scalable AWS infrastructure to host a static corporate website using ECS Fargate. The infrastructure will support future CI/CD integration and handle variable load through auto-scaling capabilities. This demo environment will serve as a foundation for the corporate website launch, providing a secure and maintainable infrastructure pattern that can be replicated across environments.

The solution includes VPC networking, Application Load Balancer, ECS Fargate service, ECR repository, and comprehensive monitoring with CloudWatch. All infrastructure will be provisioned using Terraform with parameterized configurations and managed through GitHub Actions for automated deployment workflows.

## Acceptance Criteria

- **AC-1**: VPC with public/private subnets deployed in us-east-1 region across 2 AZs (us-east-1a, us-east-1b) with specified CIDR ranges (10.0.0.0/16)
- **AC-2**: Application Load Balancer accessible from internet (0.0.0.0/0 on port 80) with target group pointing to ECS service
- **AC-3**: ECS Fargate cluster and service deployed with 2 initial tasks, auto-scaling to max 10 tasks based on CPU > 60%
- **AC-4**: ECR repository created with proper IAM permissions for ECS task image pulls
- **AC-5**: CloudWatch Log Group configured with 7-day retention for ECS task logs
- **AC-6**: CloudWatch alarm created for task failure monitoring (>10 failures threshold)
- **AC-7**: NACLs implemented for network-level security controls
- **AC-8**: All resources tagged with Environment=demo, Project=corporate-website, Owner=ssverchkov
- **AC-9**: Terraform code fully parameterized with variables (no hardcoded values)
- **AC-10**: GitHub Actions workflow operational with terraform validation, security scanning (tfsec/checkov), plan, and apply capabilities
- **AC-11**: Infrastructure documentation (README + Mermaid architecture diagram) generated and committed
- **AC-12**: ALB health checks configured on root path (/) with appropriate thresholds

## Implementation Plan

1. **Initialize Terraform Structure**
   - Set up Terraform backend configuration pointing to `ssverchkov-cloud-infrastructure-tfstate-prod` bucket in eu-central-1
   - Create main.tf, variables.tf, outputs.tf, and terraform.tfvars files
   - Configure AWS provider for us-east-1 region

2. **Network Infrastructure**
   - Provision VPC with CIDR 10.0.0.0/16
   - Create public subnets (10.0.1.0/24, 10.0.2.0/24) and private subnets (10.0.3.0/24, 10.0.4.0/24)
   - Deploy Internet Gateway and configure route tables
   - Implement NACLs for security controls

3. **Container Registry and Compute**
   - Create ECR repository for container images
   - Provision ECS Fargate cluster
   - Configure ECS service with task definition (0.25 vCPU, 512MB memory)
   - Set up auto-scaling policies (CPU-based, 60% threshold)

4. **Load Balancing and Security**
   - Deploy Application Load Balancer in public subnets
   - Create security groups (ALB: port 80 from 0.0.0.0/0, ECS tasks: ALB access only)
   - Configure target group with health checks on root path

5. **Monitoring and Logging**
   - Set up CloudWatch Log Group with 7-day retention
   - Create CloudWatch alarm for task failure monitoring
   - Configure ECS service to send logs to CloudWatch

6. **CI/CD Pipeline**
   - Create GitHub Actions workflow with manual trigger
   - Implement terraform validation, formatting, and security scanning
   - Configure AWS credentials using GitHub secrets (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
   - Set up plan and apply stages with proper error handling

7. **Documentation and Validation**
   - Generate README with setup and usage instructions
   - Create Mermaid architecture diagram
   - Validate all acceptance criteria
   - Test infrastructure deployment end-to-end

## Risks & Mitigations

| Risk | Impact | Probability | Mitigation |
|------|---------|-------------|------------|
| Terraform state conflicts | High | Low | Use prefixed state key path `ssverchkov/` in shared bucket |
| Security group misconfiguration | High | Medium | Implement least-privilege access, validate with tfsec scanning |
| ECS task startup failures | Medium | Medium | Configure proper health checks and retry policies |
| Auto-scaling cost overruns | Medium | Low | Set maximum task limit to 10, monitor with CloudWatch alarms |
| GitHub Actions credential exposure | High | Low | Use encrypted GitHub secrets, rotate credentials regularly |
| Resource naming conflicts | Low | Low | Use consistent naming conventions with environment prefixes |

## Tags
- **Project**: corporate-website
- **Owner**: ssverchkov  
- **Environment**: demo
- **Infrastructure**: terraform
- **Platform**: aws-ecs
- **Region**: us-east-1

## References
- **Original Request**: Manager email requesting new AWS environment for corporate website launch
- **Technical Constraints**: ECS Fargate, us-east-1 region, specific network CIDR ranges
- **Assumptions**: Static website deployment, minimal resource configuration for demo purposes, no custom DNS or TLS requirements
- **State Management**: Existing Terraform state bucket `cloud-infrastructure-tfstate-prod` in eu-central-1