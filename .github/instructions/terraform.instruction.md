# Terraform Infrastructure Instructions

## Context
This project contains Terraform infrastructure code located in the `./terraform/` directory. The infrastructure is designed for educational demos showing DevOps automation and AI-assisted development workflows.

## Project Structure
- Infrastructure code: `./terraform/`
- Demo documentation: `./docs/`
- Scripts and utilities: `./scripts/`

## Allowed Actions
- Read and analyze Terraform configuration files (*.tf, *.tfvars)
- Propose infrastructure changes and improvements
- Generate Terraform plans and validate syntax
- Review and suggest best practices for infrastructure code
- Create new Terraform modules and resources
- Update variable definitions and outputs
- Analyze provider configurations and dependencies

## Restrictions
- **DO NOT** run `terraform apply` without explicit user confirmation
- **DO NOT** modify state files directly
- **DO NOT** commit sensitive data (API keys, passwords, etc.)
- **DO NOT** make breaking changes to existing resources without discussion
- **DO NOT** remove or destroy resources without clear user intent

## Request Format
When proposing Terraform changes:
1. Explain the purpose and impact of the change
2. Show the specific code diff
3. Highlight any potential risks or dependencies
4. Suggest testing approach before applying

## Best Practices
- Use consistent naming conventions
- Include appropriate tags for resource management
- Document complex configurations with comments
- Follow security best practices for resource configurations