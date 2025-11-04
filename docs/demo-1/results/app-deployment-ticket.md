# Application Deployment Jira Ticket

## Title: Deploy Corporate Website Static Site to AWS ECS with CI/CD Pipeline

## Description

Deploy a containerized static website application to the existing AWS ECS infrastructure using nginx:alpine as the web server. The deployment will serve a simple HTML page from the `docs/demo-1/index.html` file through an automated CI/CD pipeline that builds, pushes to ECR, and deploys to ECS Fargate.

This deployment establishes the foundation for the corporate website launch with scalable, automated infrastructure ready for production workloads. The solution uses existing AWS resources (VPC, ALB, ECS cluster, ECR) and implements a GitHub Actions workflow for continuous deployment with manual triggering capability for demo purposes.

## Acceptance Criteria

- **AC-1:** Docker image built using nginx:alpine base image serves index.html from docs/demo-1/ directory
- **AC-2:** ECS task definition updated with minimal resources (0.25 vCPU, 0.5GB memory) and desired count set to 1
- **AC-3:** Application accessible via existing ALB DNS name on port 80 with successful health checks
- **AC-4:** GitHub Actions workflow implements build → push to ECR → deploy to ECS pipeline with manual trigger
- **AC-5:** Docker images tagged with both 'latest' and GitHub commit SHA for traceability
- **AC-6:** ECS service deployment uses rolling update strategy with new task definition revisions
- **AC-7:** CloudWatch dashboard created with basic HTTP metrics (request count, error rates)
- **AC-8:** Non-root user configured in Docker container for security best practices
- **AC-9:** IAM permissions verified for ECR pull access from ECS tasks
- **AC-10:** Documentation updated in README with deployment process and manual trigger instructions

## Implementation Plan

1. **Infrastructure Updates (Terraform)**
   - Update ECS task definition container image to use ECR repository URL
   - Modify ECS service desired count from 2 to 1
   - Adjust task definition CPU/memory to minimal Fargate allocation
   - Verify existing IAM roles have sufficient ECR permissions
   - Add CloudWatch HTTP error rate alarms for ALB target group
   - Create basic CloudWatch dashboard with application metrics

2. **Application Development**
   - Create Dockerfile with nginx:alpine base image
   - Configure non-root user execution in container
   - Copy docs/demo-1/index.html to nginx document root (/usr/share/nginx/html/)
   - Expose port 80 for container networking
   - Test container locally before deployment

3. **CI/CD Pipeline (GitHub Actions)**
   - Create `.github/workflows/deploy.yml` workflow file
   - Implement manual trigger (workflow_dispatch) from any branch
   - Configure build stage: Docker build and tag with latest + commit SHA
   - Configure push stage: Authenticate and push to existing ECR repository
   - Configure deploy stage: Create new ECS task definition revision and update service
   - Use existing GitHub Secrets for AWS credentials (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION)

4. **Validation & Testing**
   - Deploy infrastructure changes via Terraform
   - Trigger GitHub Actions workflow manually
   - Verify application accessibility via ALB DNS endpoint
   - Validate health checks and CloudWatch metrics
   - Test rollback capability using previous task definition revision

5. **Documentation**
   - Update README.md with deployment process overview
   - Add manual trigger instructions for GitHub Actions
   - Document troubleshooting steps for common deployment issues
   - Include ALB endpoint URL and expected response

## Risks & Mitigations

| Risk | Impact | Likelihood | Mitigation |
|------|---------|------------|------------|
| ECR authentication failure in GitHub Actions | High | Low | Verify AWS credentials in GitHub Secrets, test ECR access permissions |
| Single AZ deployment creates availability risk | Medium | Low | Keep multi-AZ infrastructure available, document scaling process |
| Rolling update with desired count=1 causes downtime | Medium | Medium | Accept brief downtime for demo, document blue-green option for production |
| Docker image build failures | Medium | Low | Test Dockerfile locally, implement build validation in CI pipeline |
| Insufficient ECS task permissions for ECR pull | High | Low | Verify existing IAM task execution role, add ECR permissions if needed |
| Health check failures due to nginx configuration | Medium | Low | Use default nginx config, test health endpoint locally |
| Resource constraints with minimal CPU/memory allocation | Low | Medium | Monitor CloudWatch metrics, document resource scaling process |

## Tags

- **Environment:** Demo/Prod
- **Service:** Corporate Website
- **Technology:** ECS, Docker, nginx, GitHub Actions
- **Priority:** High
- **Team:** DevOps
- **Epic:** Corporate Website Launch
- **Component:** Infrastructure, CI/CD, Application
- **Estimated Effort:** 2-3 days
- **Dependencies:** Existing AWS infrastructure

## References

- **Infrastructure Ticket:** Task 05 - Standardized Tagging Strategy Implementation
- **Manager Email:** "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website..."
- **Requirements Source:** Task 07 - Application Deployment Clarification Questions
- **Existing Infrastructure:** VPC, Subnets, ALB (HTTP 80), ECS Cluster, ECR, IAM baseline, CloudWatch Logs
- **GitHub Repository:** devops-ai-edu (GodelTech/devops-ai-edu)
- **Target Branch:** ssverchkov-demo1
- **ALB Endpoint:** corporate-website-demo-alb-65149525.us-east-1.elb.amazonaws.com

## Assumptions

- AWS credentials are properly configured in GitHub repository secrets
- Existing ECS cluster and ECR repository are functional and accessible
- NAT Gateway configuration supports ECR image pulls from private subnets
- Static website requires no backend services or database connectivity
- Demo environment acceptable for brief downtime during deployments
- Manual deployment triggering is sufficient for initial demo phase
- Default nginx configuration suitable for static file serving
- Single HTML file sufficient for initial corporate website demonstration

---

**Created:** November 4, 2025  
**Reporter:** DevOps Architect  
**Assignee:** DevOps Team  
**Status:** Ready for Implementation  
**Deadline:** End of Week (Manager Requirement)