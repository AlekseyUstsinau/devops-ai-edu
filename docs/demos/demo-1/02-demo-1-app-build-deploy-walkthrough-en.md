# Demo Walkthrough: From Clarified Requirements to App Build + ECS Deployment

## 1. Purpose

This demo shows how a DevOps engineer and LLM co-pilot can transform vague deployment requirements into a production-ready containerized application deployment.

### Demo Goals
1. Create a production-style application deployment Jira ticket (separate from the infrastructure ticket)
2. Generate iteratively refined Docker configuration, Terraform ECS task/service definitions, and GitHub Actions pipeline
3. Validate the deployment with a comprehensive security and governance checklist

### Success Criteria
By the end of this demo, the audience will see:
- The acceleration from raw requirements to a deployable static site container
- The container running on ECS Fargate behind the existing Application Load Balancer
- Complete automation from code commit to production deployment

---

## 2. Raw Context: The Manager's Email and Application Requirements

### What to Do
1. Read the manager's email aloud to the audience
2. Present the distilled application requirement
3. Highlight the missing build and deployment specifics

### The Email
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines with steps: build app, push to ECR, deploy. We need the core structure ready by the end of this week."

### Application Deployment Requirements
The following needs have been extracted from the email:
- Deploy the initial static corporate website (using the `index.html` artifact) as a containerized service
- Implement build steps: package static files, build Docker image, push to ECR, update ECS service
- Use GitHub Actions for CI/CD automation
- Leverage existing infrastructure: VPC, Subnets, ALB, ECS Cluster, ECR repository, IAM roles, CloudWatch Logs

### Infrastructure Context from Previous Demo
These components were created in the infrastructure demo and are available for reuse:
- AWS Region: `us-east-1`
- VPC with CIDR `10.0.0.0/16` including public subnets (for ALB) and private subnets (for Fargate tasks)
- Existing ALB security group: HTTP port 80 from `0.0.0.0/0` (TLS will be added in phase 2)
- Provisioned ECS Cluster
- S3 backend for Terraform state
- CloudWatch logging patterns

### Expected Outcome
The audience should recognize the gaps that still need to be filled:
- Container runtime and base image selection
- Health check configuration
- Application scaling thresholds
- ECR repository naming conventions
- Git branch strategy
- Docker image tagging patterns

---

## 3. Gap Identification for Application Deployment

### What to Do
1. Ask the audience: "What is missing to make the app deployment work item actionable?"
2. Capture answers and organize them under themes such as:
   - Container configuration (base image, runtime, dependencies)
   - Health and readiness checks
   - Scaling policies and thresholds
   - Repository and image naming conventions
   - Deployment strategy and rollback procedures

### Expected Outcome
A categorized list of application-specific gaps that will guide the clarification questions in the next step.

---

## 4. Generate Clarification Questions for Application Deployment

### What to Do
1. Use the prompt from `docs/demo-1/prompts/07-app-clarification-questions.md`
2. Paste the prompt into your LLM tool and execute it
3. Read the first block of questions aloud (typically "Image Build" questions)
4. Pause to collect answers before moving to the next block

### Demo Tips
- Encourage concise bullet-point answers to maintain momentum
- Emphasize speed compared to traditional requirements gathering

### Expected Outcome
The LLM generates the first themed block of questions, likely focused on Image Build specifics such as:
- Base image selection
- Static file web server choice
- Port configuration
- Build dependencies

---

## 5. Answer the Questions Iteratively

### What to Do
1. Answer the first block of questions
2. Say "Next block" to progress to the next set of questions
3. Maintain a clean answer sheet organized by theme
4. Keep answers visible to the audience in a notes pane

### Example Answers by Theme
- **Image Build**: "Use nginx:alpine as base, copy index.html to /usr/share/nginx/html, expose port 80"
- **ECS Configuration**: "512 CPU, 1024 memory, awsvpc network mode, Fargate platform"
- **Scaling**: "Min 2 tasks, max 10 tasks, scale on CPU > 70%, target tracking"
- **Health Checks**: "HTTP GET on / every 30s, 2 healthy threshold, 3 unhealthy threshold"

### Expected Outcome
A complete, structured answer set covering all application deployment themes:
- Image Build and Container Configuration
- ECS Task and Service Settings
- Scaling and Performance
- Health Checks and Monitoring
- CI/CD Pipeline Requirements
- Security and Access Control

---

## 6. Generate the Application Deployment Jira Ticket

### What to Do
1. Consolidate all your answers from the previous step
2. Use the application ticket generation prompt from `docs/demo-1/prompts/08-generate-app-ticket.md`
3. Paste your consolidated answers into the prompt and execute
4. Review the generated ticket for completeness

### Follow-up Options
- Create a GitHub Issue from the Markdown (if your team uses GitHub Issues)
- Create a Jira ticket using your organization's workflow

### Expected Outcome
A polished application deployment ticket containing:
- Clear title and description focused on application deployment
- Container and ECS-specific acceptance criteria
- Step-by-step implementation plan for Docker and Terraform changes
- CI/CD pipeline requirements
- Security and governance considerations

---

## 7. Generate Initial Application Code

### Important Architecture Note
**We do NOT create a new Terraform root directory.** Instead, we extend the existing `terraform/` structure from the infrastructure demo by adding only the application-specific files and resource blocks.

### What to Do
1. Use the initial code generation prompt from `docs/demo-1/prompts/09-initial-app-code.md`
2. Request both the Dockerfile and incremental Terraform changes
3. Verify that the generated code integrates with existing infrastructure

### What to Show the Audience
- The Dockerfile structure (base image, file copy, port exposure)
- New Terraform files for ECS task definition and service
- How the new resources reference existing infrastructure (VPC, subnets, ALB, cluster)
- That provider and backend configurations are NOT duplicated

### Expected Outcome
Generated code including:
- **Dockerfile**: Complete containerization specification for the static site
- **Terraform additions**: ECS task definition, service definition, and necessary IAM roles
- **Integration**: Proper references to existing infrastructure components without duplicating base configuration

---

## 8. Add GitHub Actions CI/CD Pipeline for Application

### What to Do
1. Use the application pipeline prompt from `docs/demo-1/prompts/10-app-cicd-pipeline.md`
2. Execute the prompt to generate the workflow file
3. Highlight key features to the audience:
   - Docker image build and push to ECR
   - Terraform plan and apply separation
   - Integration with the unified Terraform state from infrastructure demo
   - Automated ECS service updates after successful deployment

### Expected Outcome
A complete GitHub Actions workflow YAML file with:
- Docker build job (build image, tag appropriately, push to ECR)
- Terraform job (init, validate, plan, and gated apply)
- Proper secret management for AWS credentials and ECR access
- ECS service deployment triggered after successful Terraform apply

---

## 9. Refine for Security Best Practices

### What to Do
1. Use the security refinement prompt from `docs/demo-1/prompts/11-app-security-refinement.md`
2. Execute the prompt to apply security hardening
3. Review and highlight the security improvements to the audience

### What to Show the Audience
- **Dockerfile changes**: Addition of non-root USER directive
- **IAM policies**: Least-privilege principle applied to task execution and task roles
- **Security groups**: Tightened rules with specific port restrictions
- **Secrets management**: Use of AWS Secrets Manager or Parameter Store for sensitive data

### Expected Outcome
Security-hardened deployment with:
- Container running as non-root user
- Minimal IAM permissions following least-privilege principle
- Properly configured security group rules
- No hardcoded credentials or sensitive data in code

---

## 10. Parameterize with Variables and Add Autoscaling

### What to Do
1. Use the variables and autoscaling prompt from `docs/demo-1/prompts/12-app-variables-autoscaling.md`
2. Execute the prompt to add comprehensive parameterization and autoscaling configuration
3. Review the changes with the audience

### What to Show the Audience
- **Expanded variables**: CPU, memory, container port, desired count, all parameterized
- **Autoscaling configuration**: New Terraform file defining scaling policies
- **Scaling triggers**: CPU and memory-based target tracking policies
- **Flexibility**: Easy adjustment for different environments

### Expected Outcome
Fully parameterized and scalable application deployment with:
- Enhanced `variables.tf` with application-specific parameters
- New `autoscaling.tf` file in the existing Terraform root
- Target tracking scaling policies based on CPU and memory utilization
- Environment-specific configuration flexibility

---

## 11. Apply Tag and Governance Consistency

### What to Do
1. Use the governance consistency prompt from `docs/demo-1/prompts/13-app-governance-tags.md`
2. Execute the prompt to ensure uniform tagging across all resources
3. Scan through the updated code to verify compliance

### What to Show the Audience
- **Centralized tagging**: All resources use a single `default_tags` map
- **Consistent metadata**: Environment, project, cost center, owner tags applied uniformly
- **Governance compliance**: Alignment with organizational tagging policies
- **Cost tracking**: Tags enable proper cost allocation and reporting

### Expected Outcome
Governance-compliant infrastructure with:
- Uniform tag application via centralized `default_tags` configuration
- All application resources properly tagged
- Easy identification of resources for cost allocation and management
- Compliance with organizational governance policies

---

## 12. Deployment and Wrap Up

### What to Do
1. Summarize the complete workflow and time savings
2. Calculate the acceleration compared to manual approaches
3. Optionally trigger a `workflow_dispatch` run to demonstrate:
   - Docker image build and push
   - Terraform plan generation
   - Gated approval process
   - ECS service deployment

### Key Talking Points
- **Speed**: From vague requirements to production-ready containerized deployment
- **Quality**: Secure, scalable, and governance-compliant code generated systematically
- **Completeness**: Full CI/CD pipeline with Docker build, Terraform automation, and ECS deployment
- **Best Practices**: Security hardening, autoscaling, proper tagging, and least-privilege IAM all applied

### Impact Statement Template
"Using the LLM co-pilot, we converted a vague email into a production-ready deployment pipeline with containerization, Terraform service definitions, autoscaling, and governance compliance in under [X] minutes. The traditional manual process would have taken [Y] hours/days with multiple rounds of clarification and reviews."

### Future Enhancements to Highlight
- TLS/SSL configuration on the Application Load Balancer
- AWS WAF integration for application protection
- Automated container image scanning with ECR or third-party tools
- AWS Systems Manager Parameter Store for configuration management
- Blue/green or canary deployment strategies
- Multi-region deployment patterns

### Expected Outcome
The audience should clearly understand:
- The complete ROI of LLM-assisted DevOps workflows
- The systematic approach to building production-grade infrastructure
- How to apply this methodology to their own projects
- The natural evolution path for continuous improvement
