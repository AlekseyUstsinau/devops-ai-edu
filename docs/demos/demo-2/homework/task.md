# Homework Task: Infrastructure Improvement and Optimization Journey

## Overview

This assignment demonstrates how to use AI tools (LLMs and GitHub Copilot) to systematically improve existing infrastructure through iterative optimization passes. Unlike Demo 1 which focused on building from scratch, this homework focuses on enhancing, securing, and optimizing already-deployed infrastructure.

---

## Business Context

Your team has successfully deployed the staging environment from Demo 1. However, after running for a few weeks, the following feedback has been received:

```
Subject: Infrastructure improvements needed for staging environment

Hi team,

The staging environment is working, but we need to address several concerns before 
we can promote this pattern to production:

1. **Cost Control**: We're exceeding budget. Need to optimize resource usage and 
   implement better autoscaling.

2. **Security Audit**: InfoSec flagged several issues - overly permissive IAM 
   policies, missing security controls, and inadequate logging retention.

3. **Operational Excellence**: Logs are scattered and hard to analyze during 
   incidents. Need better structure and faster incident response capability.

4. **Multi-Region Strategy**: Business is considering GCP expansion. We need to 
   understand feasibility of running equivalent infrastructure there.

Please improve the existing infrastructure systematically without adding unnecessary 
services. Document your process and the impact of each improvement.

Thanks,
Senior Engineering Manager
```

---

## Objectives

Your goal is to enhance the existing Demo 1 infrastructure through systematic improvement passes:

1. **Infrastructure Hygiene**: Apply foundational best practices for consistency and maintainability
2. **Security Hardening**: Implement security controls and improve observability
3. **Cost Optimization**: Right-size resources and implement intelligent autoscaling
4. **Incident Response**: Demonstrate rapid log analysis and incident communication
5. **Cloud Portability**: Translate infrastructure to an alternative cloud provider (GCP or Azure)

---

## Technical Requirements

### Starting Point
You must have completed Demo 1 homework (or have equivalent infrastructure):
- Terraform-managed AWS infrastructure with EC2 Auto Scaling Group
- Application Load Balancer with target group
- GitHub Actions CI/CD pipeline
- Working web application deployment

### Improvement Categories

#### 1. Infrastructure Hygiene (Required)
Apply foundational best practices:
- **Tagging**: Standardize tags across all resources (Environment, Owner, Project, CostCenter)
- **Parameterization**: Convert hard-coded values to Terraform variables
- **Logging**: Standardize CloudWatch log retention policies
- **CI/CD**: Pin GitHub Actions versions, add caching, implement path filters
- **Documentation**: Add resource descriptions and comments

#### 2. Security Hardening (Required)
Enhance security posture:
- **IAM**: Apply least-privilege principles to all IAM roles and policies
- **Network**: Tighten security group rules, add descriptions
- **Secrets**: Ensure no credentials in code, proper use of GitHub Secrets
- **Supply Chain**: Pin dependencies with SHA hashes where possible
- **Monitoring**: Add security-focused CloudWatch alarms (failed logins, unusual traffic)

#### 3. Cost Optimization (Required)
Implement FinOps practices:
- **Right-Sizing**: Optimize EC2 instance types and sizes
- **Autoscaling**: Implement target tracking autoscaling policies
- **Resource Cleanup**: Add scheduled instance shutdowns (nights/weekends)
- **Tagging**: Add cost allocation tags for better tracking
- **Analysis**: Calculate and document estimated monthly savings

#### 4. Incident Response (Required)
Demonstrate operational capabilities:
- **Log Collection**: Gather actual logs from your running infrastructure
- **Analysis**: Use LLM to analyze patterns and identify issues
- **Documentation**: Create incident postmortem and runbook
- **Alerting**: Define CloudWatch alarms for critical metrics

#### 5. Multi-Cloud Translation (Optional - Bonus)
Translate to alternative cloud provider:
- **Target**: Choose GCP or Azure
- **Mapping**: Document service equivalents
- **Implementation**: Create equivalent IaC for alternative cloud
- **Comparison**: Document differences, limitations, cost implications

---

## Deliverables

Create the following structure in your repository:

```
docs/demo-2-hw/
├── 00_improvement_request.md       # Copy of the business request
├── 01_hygiene_summary.md           # Summary of best practices applied
├── 02_security_summary.md          # Security improvements documentation
├── 03_finops_summary.md            # Cost optimization analysis
├── 04_incident_analysis.md         # Log analysis and incident response
├── 05_multicloud_feasibility.md    # Multi-cloud translation (optional)
└── prompts/
    ├── 01-hygiene-prompt.md        # Prompt for infrastructure hygiene
    ├── 02-security-prompt.md       # Prompt for security hardening
    ├── 03-finops-prompt.md         # Prompt for cost optimization
    ├── 04-incident-prompt.md       # Prompt for incident analysis
    └── 05-multicloud-prompt.md     # Prompt for multi-cloud translation

terraform/
├── <improved files>                # Updated Terraform configurations
├── variables.tf                    # Enhanced variables
├── outputs.tf                      # Additional outputs
└── <other improved files>

.github/
└── workflows/
    └── <improved workflows>        # Enhanced GitHub Actions workflows

```

---

## Acceptance Criteria

Your solution must meet the following requirements:

### Infrastructure Hygiene
- [ ] All resources have consistent tagging scheme applied
- [ ] Hard-coded values extracted to variables with descriptions
- [ ] CloudWatch log retention standardized across all log groups
- [ ] GitHub Actions use pinned versions (preferably with SHA)
- [ ] Caching implemented in CI/CD pipeline
- [ ] Path filters prevent unnecessary workflow runs

### Security Hardening
- [ ] IAM policies follow least-privilege principle with specific resource ARNs
- [ ] Security group rules tightened to minimum required ports
- [ ] All security group rules have descriptive comments
- [ ] No credentials or secrets in repository code
- [ ] CloudWatch alarms defined for security events
- [ ] Documentation includes security control mapping

### Cost Optimization
- [ ] Resource right-sizing completed with justification
- [ ] Target tracking autoscaling policies implemented
- [ ] Cost allocation tags added to all billable resources
- [ ] Estimated monthly savings calculated and documented
- [ ] Before/after cost comparison table included
- [ ] Scheduled shutdowns implemented (if applicable)

### Incident Response
- [ ] Actual logs collected from running infrastructure
- [ ] Log analysis performed using LLM
- [ ] Root cause analysis documented
- [ ] Incident postmortem created
- [ ] Runbook or troubleshooting guide written
- [ ] CloudWatch alarms defined for identified issues

### Multi-Cloud Translation (Optional)
- [ ] Service mapping table created (AWS to GCP/Azure)
- [ ] Equivalent IaC written for target cloud
- [ ] Architectural differences documented
- [ ] Cost comparison analysis provided
- [ ] Migration considerations identified

### Documentation Quality
- [ ] All prompts saved with descriptive names
- [ ] Each summary document includes before/after comparison
- [ ] Impact quantified where possible (cost, time, risk)
- [ ] Process clearly documented for reproducibility
- [ ] All changes explained with clear rationale

---

## Constraints and Guidelines

- Work with your existing Demo 1 infrastructure
- Apply improvements incrementally
- Document every prompt and iteration
- Maintain infrastructure functionality throughout
- No hard-coded credentials or secrets

---

## Submission Guidelines

Your submission will be evaluated on:

1. **Completeness** (40%) - All required improvement categories completed with comprehensive documentation
2. **Impact** (30%) - Measurable improvements in cost, security, and operations
3. **Quality** (20%) - Code follows best practices with clear rationale
4. **Process** (10%) - Systematic approach with documented iterations

---

## Bonus Challenges

For students who complete core requirements and want extra challenge, consider implementing advanced features in security, optimization, or operations beyond the basic requirements.

---

## Success Criteria

A successful submission demonstrates systematic improvement, measurable impact, professional documentation, effective LLM usage, and understanding of DevOps best practices.

By completing this homework, you will transform a basic deployment into well-architected, secure, cost-optimized infrastructure while learning to leverage AI tools to accelerate this transformation process.
