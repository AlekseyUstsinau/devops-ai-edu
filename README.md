# DevOps AI Education - Final Project

This repository contains materials for the final project of the "DevOps AI Education" course — a practical assignment focused on creating infrastructure and CI/CD pipelines using AI tools.

## 🎯 About the Course

The "DevOps AI Education" course teaches effective use of Large Language Models (LLMs) as assistants to accelerate DevOps workflows. You will learn to:
- Create effective prompts for generating infrastructure code
- Iteratively improve AI outputs from questions to code to optimizations
- Evaluate AI-generated code for security and best practices
- Apply proven interaction patterns with AI for DevOps tasks

## 📂 Repository Contents

```
devops-ai-edu/
├── README.md              # This file
└── homework/              # Final project assignments
    ├── README.md          # Requirements and evaluation criteria
    ├── task1.md           # Phase 1: Architecture Design
    ├── task2.md           # Phase 2: Infrastructure as Code
    ├── task3.md           # Phase 3: CI/CD Pipeline
    └── task4.md           # Phase 4: Security and Optimization
```

## 🚀 Final Project

### Project Overview

The final project is a practical assignment where you must:
- Design and implement infrastructure for a staging environment in AWS
- Create a complete CI/CD pipeline for application deployment
- Apply security and optimization best practices
- **Use AI tools to generate all code**

### Core Requirement

**All code and infrastructure must be generated using AI assistance.** This project tests your ability to:
- Formulate effective prompts
- Guide AI toward production-ready solutions
- Iteratively improve generated code
- Critically evaluate AI suggestions

### Mandatory Deliverables

1. **Prompts Documentation** (`PROMPTS.md`)
   - Minimum 4 prompts (one per phase)
   - Created manually (not by AI!)
   - Description of context and iterations

2. **Working Infrastructure and Application Code**
   - Terraform configuration
   - CI/CD pipeline (GitHub Actions)
   - Dockerfile and application configuration
   - All necessary scripts

### Project Phases

#### Phase 1: Architecture Design ([task1.md](homework/task1.md))
- Business requirements analysis
- Architecture design
- Technology decision justification
- Cost estimation

#### Phase 2: Infrastructure as Code ([task2.md](homework/task2.md))
- Terraform configuration for AWS
- VPC, Security Groups, IAM
- Compute resources (ECS/EC2/Lambda)
- Best practices and variables

#### Phase 3: CI/CD Pipeline ([task3.md](homework/task3.md))
- GitHub Actions workflow
- Test and deployment automation
- Plan/apply stage separation
- Secrets management

#### Phase 4: Security and Optimization ([task4.md](homework/task4.md))
- Security hardening
- Cost optimization
- Monitoring and logging
- Documentation

### Evaluation Criteria

✅ **Functionality** (Critical)
- Code is fully functional
- CI/CD pipeline shows green status
- `terraform apply` completes successfully

✅ **Code Quality**
- Clean, well-structured code
- Following best practices
- Proper use of variables

✅ **Security**
- Least-privilege IAM policies
- Secure secrets management
- Security groups with minimal permissions

✅ **Documentation**
- Prompts file (PROMPTS.md)
- README with instructions
- Architecture diagram

For detailed criteria, see [homework/README.md](homework/README.md).

##  Best Practices for Working with AI

### Prompt Design

1. **Be Specific**: Clearly state expected output format
2. **Provide Context**: Include relevant project information
3. **Set Boundaries**: Explicitly state what should NOT be changed
4. **Request Explanations**: Ask AI to explain its decisions

### Interaction Patterns

1. **Iterate Quickly**: Treat AI output as proposals
2. **Validate Thoroughly**: Check code against security checklists
3. **Document the Process**: Save prompts for PROMPTS.md
4. **Apply Critical Thinking**: Don't accept code blindly

### Common Pitfalls

❌ Accepting code without security review  
❌ Skipping variable parameterization  
❌ Expanding scope beyond requirements  
❌ Forgetting to pin dependency versions  

## 🛠️ Requirements

- AWS account (free tier recommended)
- Access to LLM (Claude, ChatGPT, or similar)
- Basic understanding of Terraform, Docker, GitHub Actions
- GitHub repository for code storage

## 📚 Additional Resources

### Documentation
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS ECS Best Practices](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

### Recommended Tools
- **Terraform** — Infrastructure as Code
- **AWS CLI** — AWS resource management
- **Docker** — Application containerization
- **GitHub Actions** — CI/CD automation

## 🎓 Getting Started

1. **Read the requirements**: Start with [homework/README.md](homework/README.md)
2. **Study the tasks**: Go through task1-task4 sequentially
3. **Document prompts**: Create PROMPTS.md as you work
4. **Test**: Ensure CI/CD pipeline works correctly

## ⚠️ Important Notes

- **All infrastructure must be destroyed** after project completion (use `terraform destroy`)
- **Do not commit secrets** to the repository
- **Use variables** instead of hardcoded values
- **Document all prompts** — this is a mandatory part of the project
- **PROMPTS.md file is created manually**, not by AI

## 📝 License

This project is created for educational purposes.

---

**Last Updated**: January 2026  
**Maintained by**: GodelTech DevOps Team
