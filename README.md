# DevOps AI Education Demos

This repository demonstrates how to use Large Language Models (LLMs) as a co-pilot to accelerate DevOps workflows. You'll learn how to transform vague business requirements into production-ready infrastructure and applications through structured prompts and iterative refinement.

## What You'll Learn

This hands-on training teaches you to:
- Design effective prompts for infrastructure and application delivery
- Iteratively refine AI output from questions to tickets to code to optimizations
- Evaluate AI-generated code for governance, security, and best practices
- Use reusable prompt templates for common DevOps tasks

## Repository Overview

This repository contains three progressive demo tracks:

## Repository Overview

This repository contains three progressive demo tracks:

### Demo 0: Preparation and Setup
**Goal**: Establish the foundation for AI-assisted DevOps workflows

Set up minimal instruction files that guide the AI agent on allowed actions, restrictions, and available context. This includes connecting the GitHub MCP server for repository operations.

**Documentation**: [Demo 0 Walkthrough](docs/demos/demo-1/00-demo-0-prep-walkthrough-en.md)

---

### Demo 1: From Vague Email to Production Deployment
**Goal**: Transform unstructured requirements into complete infrastructure and application deployment

This demo has two parts that build on each other:

#### Part 1: Infrastructure Setup
Transform a vague manager email into production-ready AWS infrastructure:
- Generate clarification questions to fill requirement gaps
- Create structured Jira tickets with acceptance criteria
- Generate Terraform code for VPC, ECS Fargate, ALB, ECR
- Build GitHub Actions CI/CD pipeline
- Apply best practices: tagging, variables, security hardening

**Documentation**: [Demo 1 Infrastructure Walkthrough](docs/demos/demo-1/01-demo-1-infra-walkthrough-en.md)

#### Part 2: Application Deployment
Deploy a containerized application using the infrastructure from Part 1:
- Separate clarification cycle for application requirements
- Create Dockerfile and ECS service definitions
- Extend existing Terraform (no duplication)
- Add application CI/CD pipeline
- Implement security hardening, autoscaling, and governance

**Documentation**: [Demo 1 Application Walkthrough](docs/demos/demo-1/02-demo-1-app-build-deploy-walkthrough-en.md)

**Key Learning**: Structured prompts, iterative improvement, minimal manual editing

---

### Demo 2: Post-Deployment Improvements
**Goal**: Systematically enhance existing infrastructure

Use direct action prompts (no Q&A phase) to rapidly improve deployed infrastructure across five focus areas:

1. **Foundational Best Practices** - Infrastructure hygiene and consistency
2. **Security and Observability** - Hardening and monitoring improvements
3. **FinOps Optimization** - Cost reduction and autoscaling
4. **Incident Response** - Log analysis and communication acceleration
5. **Multi-Cloud Translation** - AWS to Azure conversion skeleton

**Documentation**: [Demo 2 Walkthrough](docs/demos/demo-2/demo-2.md)

**Key Learning**: Accelerated workflow pattern (Context → Action → Impact) for operational improvements

---

## Repository Structure

```
devops-ai-edu/
├── README.md                    # This file
├── docs/
│   ├── demos/
│   │   ├── demo-1/              # Demo 0 and Demo 1 materials
│   │   │   ├── 00-demo-0-prep-walkthrough-en.md
│   │   │   ├── 01-demo-1-infra-walkthrough-en.md
│   │   │   ├── 02-demo-1-app-build-deploy-walkthrough-en.md
│   │   │   ├── homework/        # Practice exercises
│   │   │   │   └── task.md
│   │   │   └── prompts/         # All Demo 1 prompt templates
│   │   │       ├── 01-clarification-questions.md
│   │   │       ├── 02-generate-jira-ticket.md
│   │   │       ├── 03-initial-terraform-draft.md
│   │   │       ├── 04-github-actions-pipeline.md
│   │   │       ├── 05-best-practice-refinement-tags.md
│   │   │       ├── 06-variables-everywhere.md
│   │   │       ├── 07-app-clarification-questions.md
│   │   │       ├── 08-generate-app-ticket.md
│   │   │       ├── 09-initial-app-code.md
│   │   │       ├── 10-app-cicd-pipeline.md
│   │   │       ├── 11-app-security-refinement.md
│   │   │       ├── 12-app-variables-autoscaling.md
│   │   │       ├── 13-app-governance-tags.md
│   │   │       └── 14-infrastructure-cleanup.md
│   │   └── demo-2/              # Demo 2 materials
│   │       ├── demo-2.md        # Main walkthrough
│   │       ├── homework/        # Practice exercises
│   │       └── prompts/         # All Demo 2 prompt templates
│   │           ├── 01-best-practices.md
│   │           ├── 02-security-hardening.md
│   │           ├── 03-finops-optimization.md
│   │           ├── 04-logging-analysis.md
│   │           └── 05-infra-converter.md
│   └── lectures/                # Presentation materials
├── files/
│   ├── app/                     # Sample application files
│   │   └── index.html           # Static website example
│   └── infra/                   # Sample infrastructure files
│       ├── ecs_service_and_task.tf
│       └── main.yaml
└── .github/
    └── instructions/            # AI agent instruction files (to be created)
        ├── terraform.instruction.md
        └── jira.instruction.md
```

---

## Quick Start Guide

### Prerequisites
- Access to an LLM (Claude, ChatGPT, or similar)
- AWS account (for Demo 1 and Demo 2)
- Basic understanding of Terraform, Docker, and GitHub Actions
- GitHub repository with MCP server configured (optional but recommended)

### Getting Started

1. **Start with Demo 0**: Set up your AI agent instructions
   - Review [Demo 0 Walkthrough](docs/demos/demo-1/00-demo-0-prep-walkthrough-en.md)
   - Create instruction files in `.github/instructions/`
   - Connect GitHub MCP server if using integrated tools

2. **Run Demo 1**: Build infrastructure and deploy an application
   - Follow [Infrastructure Walkthrough](docs/demos/demo-1/01-demo-1-infra-walkthrough-en.md) step by step
   - Use prompts from `docs/demos/demo-1/prompts/` in sequence
   - Continue with [Application Walkthrough](docs/demos/demo-1/02-demo-1-app-build-deploy-walkthrough-en.md)
   - Keep a running document of your answers for ticket generation

3. **Advance to Demo 2**: Improve your deployed infrastructure
   - Review [Demo 2 Walkthrough](docs/demos/demo-2/demo-2.md)
   - Select which improvement cases to demonstrate
   - Use direct action prompts from `docs/demos/demo-2/prompts/`

### Time Estimates
- **Demo 0**: 15-30 minutes (setup)
- **Demo 1 Infrastructure**: 45-60 minutes
- **Demo 1 Application**: 45-60 minutes
- **Demo 2 Full**: 90-120 minutes (or 60-75 minutes condensed)

---

## Understanding the Prompt Categories

### Demo 1 Prompts (14 total)

**Infrastructure Track** (Prompts 1-6):
1. **Clarification Questions** - Generate structured questions to fill requirement gaps
2. **Jira Ticket Generation** - Create tickets with acceptance criteria and implementation plans
3. **Initial Terraform Draft** - Generate baseline infrastructure code
4. **GitHub Actions Pipeline** - Build CI/CD workflows with plan/apply separation
5. **Best Practice Refinement** - Apply tagging and governance standards
6. **Variables Expansion** - Parameterize all hardcoded values

**Application Track** (Prompts 7-14):
7. **App Clarification Questions** - Application-specific requirement gathering
8. **App Jira Ticket** - Deployment ticket for containerized application
9. **Initial App Code** - Dockerfile and ECS service definitions
10. **App CI/CD Pipeline** - Docker build and deployment automation
11. **App Security Refinement** - Container and IAM hardening
12. **App Variables and Autoscaling** - Parameterization and scaling policies
13. **App Governance Tags** - Tag consistency across application resources
14. **Infrastructure Cleanup** - Teardown procedures

### Demo 2 Prompts (5 total)

1. **Best Practices** - Infrastructure hygiene audit and improvements
2. **Security Hardening** - Comprehensive security enhancements
3. **FinOps Optimization** - Cost reduction and resource efficiency
4. **Logging Analysis** - Incident triage and communication
5. **Infrastructure Converter** - AWS to Azure translation

---

## Workflow Patterns

### Demo 1: Comprehensive Build (Greenfield Projects)

This workflow is ideal when building new infrastructure or applications from scratch:

1. **Gap Identification** - Analyze vague requirements and identify missing information
2. **Clarification Questions** - Generate structured questions organized by theme
3. **Answer Collection** - Gather responses in a structured format
4. **Ticket Generation** - Create formal work items with acceptance criteria
5. **Code Generation** - Produce initial Terraform, Docker, or workflow files
6. **Iterative Refinement** - Apply successive improvements for security, governance, optimization
7. **Impact Summary** - Document time savings and quality improvements

**Use when**: Starting new projects, unclear requirements, need stakeholder alignment

---

### Demo 2: Rapid Improvement (Operational Enhancements)

This streamlined workflow is faster for improving existing infrastructure:

1. **Context Understanding** - Identify current state and improvement goals
2. **Direct Action Prompt** - Execute focused improvement prompts
3. **Impact Summary** - Review changes and communicate benefits

**Use when**: Improving existing systems, operational urgency, well-defined scope

---

## Best Practices and Governance

Every demo emphasizes these core principles:

### Tagging and Organization
- Centralized tag maps using Terraform locals
- Consistent metadata across all resources (environment, project, cost center, owner)
- Tag compliance for cost allocation and governance

### Security
- **IAM**: Least-privilege policies with specific resource ARNs
- **Containers**: Non-root USER directive in Dockerfiles
- **Secrets**: Never hardcode credentials; use AWS Secrets Manager or Parameter Store
- **Supply Chain**: Pin action versions with SHA hashes in CI/CD
- **Networking**: Security groups with minimal required access

### Infrastructure as Code
- **Variables**: Parameterize all configurable values (CIDRs, scaling thresholds, names)
- **State Management**: Use remote S3 backends with locking
- **Code Organization**: Logical file separation (networking, compute, monitoring)
- **No Duplication**: Extend existing Terraform; don't create duplicate providers/backends

### CI/CD
- **Separation**: Plan and apply stages must be distinct
- **Gating**: Manual approval required before infrastructure changes
- **Artifacts**: Store plans for review and audit
- **Secrets**: Use GitHub secrets or AWS IAM roles; never plaintext

### Cost Optimization
- **Right-Sizing**: Match resources to actual workload requirements
- **Autoscaling**: Target tracking policies based on metrics
- **Retention**: Optimize log retention periods
- **Monitoring**: Track cost allocation through tags

---

## AI Output Validation Checklist

Use this checklist during demos to validate LLM-generated code:

### Code Quality
- [ ] All resources have consistent tagging applied
- [ ] No hardcoded values that should be variables
- [ ] Variable names are descriptive with helpful descriptions
- [ ] File structure matches requested organization
- [ ] No duplicate provider or backend configurations

### Security
- [ ] IAM policies use least-privilege principles
- [ ] Security groups have minimal required access
- [ ] Secrets referenced properly (no plaintext credentials)
- [ ] Container images run as non-root users
- [ ] GitHub Actions use pinned versions with SHA hashes

### CI/CD
- [ ] Pipeline stages properly separated (plan vs apply)
- [ ] Manual approval gates configured for production changes
- [ ] Terraform plans stored as artifacts
- [ ] Secrets managed through proper mechanisms

### Governance
- [ ] Log retention periods standardized
- [ ] Autoscaling thresholds documented and justified
- [ ] No out-of-scope services introduced
- [ ] Cost allocation tags applied
- [ ] Naming conventions followed consistently

### Functionality
- [ ] Resources reference existing infrastructure correctly
- [ ] Dependencies properly declared
- [ ] Health checks configured appropriately
- [ ] Monitoring and alerting included

---

## Tips for Effective AI Collaboration

### Prompt Design
1. **Be Specific**: Clearly state output format expectations (diffs, tables, sections)
2. **Provide Context**: Include relevant existing code and organizational standards
3. **Set Boundaries**: Explicitly state what should NOT be changed
4. **Request Rationale**: Ask the AI to explain its decisions

### Interaction Patterns
1. **Iterate Quickly**: Treat AI output as proposals; review for correctness and governance
2. **Time-Box**: Keep interactions focused to demonstrate acceleration vs manual work
3. **Document Answers**: Maintain running notes during clarification phases
4. **Validate Thoroughly**: Always review generated code against your checklist

### Common Pitfalls to Avoid
- Accepting code without reviewing security implications
- Skipping variable parameterization for "simple" values
- Allowing scope creep (additional unrquested services)
- Not testing generated workflows before committing
- Forgetting to pin dependency versions

---

## Future Enhancements

Ideas for extending these demos:

### Phase 2: Advanced Security
- TLS/SSL termination configuration on ALB
- AWS WAF integration for application protection
- Automated container image scanning (Trivy, Grype)
- Secrets rotation automation

### Phase 3: Advanced Optimization
- Predictive autoscaling based on historical patterns
- CloudWatch anomaly detection integration
- Reserved instance or savings plan recommendations
- Multi-region deployment patterns

### Phase 4: Governance and Compliance
- Policy-as-code with Open Policy Agent (OPA)
- Automated security scanning with tfsec or Checkov
- Compliance framework mapping (SOC 2, ISO 27001, HIPAA)
- Drift detection and automatic remediation

### Phase 5: Observability
- Distributed tracing with X-Ray
- Custom CloudWatch dashboards
- Advanced log aggregation and analysis
- Synthetic monitoring and canary deployments

---

## Measuring Success

### Quantitative Metrics
Track these during demos to demonstrate impact:

- **Time Savings**: Minutes with LLM vs hours/days manually
- **Code Volume**: Lines of Terraform/YAML generated
- **Security Issues**: Number of vulnerabilities identified and fixed
- **Cost Optimization**: Estimated monthly savings from right-sizing
- **Consistency**: Percentage of resources properly tagged

### Qualitative Benefits
- **Reduced Toil**: Less time on repetitive infrastructure tasks
- **Improved Quality**: Consistent application of best practices
- **Knowledge Transfer**: Learning tool for new cloud services
- **Faster Iteration**: Rapid prototyping and experimentation
- **Better Documentation**: Generated tickets and postmortems

### Impact Statement Template

Use this template to summarize demo results:

> "Using LLM-assisted workflows, we transformed a vague email into production-ready infrastructure and application deployment (Terraform + Docker + CI/CD + security hardening) in **[X] minutes** compared to an estimated **[Y] hours/days** manually.
>
> Subsequent improvements (security hardening, cost optimization, incident analysis, multi-cloud translation) delivered **[Z]** measurable enhancements in **[W] minutes**.
>
> This represents approximately **[N]%** reduction in time-to-delivery while maintaining or improving code quality and security posture."

---

## Contributing

We welcome contributions to improve these demos and add new scenarios.

### How to Contribute

1. **Fork** the repository or create a branch
2. **Add** new prompt templates under appropriate `docs/demos/demo-X/prompts/` folders
3. **Update** documentation to reflect new content
4. **Test** your prompts to ensure they produce expected results
5. **Submit** a pull request with clear description of changes

### Contribution Guidelines

- Keep Markdown formatting consistent with existing files
- Use descriptive commit messages
- Test all prompt templates before submitting
- Update the README if adding new demo tracks
- Do not commit generated secrets, credentials, or proprietary configuration
- Include rationale for new patterns or approaches

### Areas for Contribution

- New prompt templates for additional AWS services
- Multi-cloud examples (Azure, GCP)
- Kubernetes and container orchestration scenarios
- Monitoring and observability patterns
- Cost optimization strategies
- Security hardening techniques

---

## Additional Resources

### Related Tools and Technologies
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS ECS Best Practices](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

### Further Learning
- Practice with the homework assignments in `docs/demos/demo-1/homework/` and `docs/demos/demo-2/homework/`
- Experiment with different LLM models to compare results
- Adapt prompts for your organization's specific requirements
- Build custom instruction files for your team's standards

---

## License

This project is intended for educational purposes. Please add an appropriate license file (e.g., MIT) if you plan to share externally.

---

## Support and Questions

For questions, issues, or discussions about these demos:
- Open an issue in the GitHub repository
- Review existing demo walkthroughs for detailed guidance
- Check the validation checklist if generated code seems incorrect

---

**Last Updated**: November 2025  
**Maintained by**: GodelTech DevOps Team
