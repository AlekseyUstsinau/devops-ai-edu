# Demo Walkthrough: From Vague Email to Terraform + CI/CD

## 1. Purpose

This demo shows how a DevOps engineer can use an LLM as a co-pilot to rapidly transform an unstructured business request into production-ready infrastructure code and automation.

### Demo Goals
1. Create a production-style infrastructure Jira ticket from vague requirements
2. Generate iteratively refined Terraform code with a GitHub Actions CI/CD pipeline
3. Document the time savings and impact

### Success Criteria
By the end of this demo, the audience will understand:
- How to extract actionable requirements from vague business requests
- The step-by-step process of using LLM assistance for infrastructure automation
- The quality and completeness of LLM-generated deliverables (tickets, code, pipelines)

---

## 2. Raw Context: The Manager's Email

### What to Do
1. Read the email aloud to the audience
2. Pause and ask: "What concrete infrastructure parameters are missing?"
3. Highlight the tension between urgency and lack of specifications

### The Email
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. It must be scalable and secure enough to handle future load. Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines. We need the core structure ready by the end of this week."

### Known Organizational Patterns
These are existing standards in your organization that you can reference:
- AWS Region: `us-east-1`
- VPC with public and private subnets
- ECS Fargate for container orchestration
- ECR for container image storage
- S3 backend for Terraform state
- CloudWatch Logs for monitoring
- GitHub Actions for CI/CD automation
- Static website starting point: `index.html`

### Expected Outcome
The audience should recognize:
- The baseline context we're working with
- The significant gaps in technical specifications
- The challenge of translating vague requirements into actionable work

---

## 3. Gap Identification and Audience Engagement

**Note**: This step is optional if you've already pre-filled the gaps before the demo.

### What to Do
1. Ask the audience: "What is missing to turn this email into actionable engineering work?"
2. Capture answers and organize them into categories (Architecture, Security, Scalability, etc.)
3. Use this as a transition to show how the LLM will help fill these gaps

### Expected Outcome
A categorized list of missing information that will be used as input for the LLM prompts in the next steps.

---

## 4. Generate Clarification Questions

### What to Do
1. Use the prompt from `docs/demo-1/prompts/01-clarification-questions.md`
2. Paste the prompt into your LLM tool and execute it
3. Read the first block of questions aloud to the audience
4. Ask if anyone has additional questions to add before proceeding

### Demo Tips
- Keep your answers concise using bullet points
- Emphasize how this is much faster than traditional back-and-forth email chains
- Show the structured nature of LLM-generated questions

### Expected Outcome
The LLM should generate themed blocks of questions (e.g., Architecture, Security, Scalability) with focused, numbered questions in each category.

---

## 5. Answer the Questions Iteratively

### What to Do
1. Work through each block of questions one at a time
2. After answering one block, say "Next block" to progress to the next set
3. Keep a running document with all answers organized by theme
4. Capture answers in a notes pane visible to the audience

### Example Answers
- **Architecture**: "ALB for ingress, HTTP only for now, TLS in phase 2"
- **Scalability**: "Target steady 500 RPS, scale on CPU > 60%, min 2 tasks, max 10"
- **Security**: "Private subnets for ECS tasks, security groups restricting inbound to ALB only"

### Expected Outcome
A complete, structured answer set covering all key areas:
- Architecture
- Security
- Scalability
- Observability
- Compliance and Governance
- Delivery and Operations

---

## 6. Generate the Infrastructure Jira Ticket

### What to Do
1. Consolidate all your answers from the previous step
2. Use the Jira generation prompt from `docs/demo-1/prompts/02-generate-jira-ticket.md`
3. Paste your consolidated answers into the prompt and execute
4. Review the acceptance criteria for testability
5. Copy the generated Markdown into Jira (manually or via API)

### Follow-up Options
- Create a GitHub Issue from the Markdown using MCP (if your team uses GitHub Issues)
- Create a Jira ticket directly from the Markdown

### Demo Tips
Point out how little editing is required for the generated ticket to be production-ready.

### Expected Outcome
A polished infrastructure Jira ticket containing:
- Clear title and description
- Testable acceptance criteria
- Detailed implementation plan
- Risk assessment
- Appropriate tags and labels
- Reference links

---

## 7. Generate Initial Terraform Code

### What to Do
1. Use the prompt from `docs/demo-1/prompts/03-initial-terraform-draft.md`
2. Execute the prompt and let it complete fully
3. Verify that all requested files are generated
4. Note any items that were deferred for later refinement

### What to Show the Audience
- The structure of generated Terraform files
- Initial resource scaffolding
- Basic variable definitions

### Expected Outcome
Complete Terraform file structure including:
- Main configuration files
- Resource definitions matching the ticket requirements
- Initial variables with minimal hardcoding

---

## 8. Add GitHub Actions CI/CD Pipeline

### What to Do
1. Use the pipeline prompt from `docs/demo-1/prompts/04-github-actions-pipeline.md`
2. Execute the prompt to generate the workflow file
3. Highlight key features to the audience:
   - Separation of plan and apply stages
   - Use of secrets instead of plaintext credentials
   - Gated approval process for apply

### Expected Outcome
A complete GitHub Actions workflow YAML file with:
- Checkout and setup steps
- Terraform initialization
- Validation checks
- Plan generation (with artifact storage and PR comments)
- Gated apply step requiring approval

---

## 9. Refine for Best Practices: Tags and Governance

### What to Do
1. Use the refinement prompt from `docs/demo-1/prompts/05-best-practice-refinement-tags.md`
2. Execute the prompt to apply governance standards
3. Scan through the updated resources and highlight:
   - Centralized tag map usage across all resources
   - Consistent naming conventions
   - Governance policy alignment

### Expected Outcome
Modified Terraform code where:
- All resources use a standardized tag map
- No resources are left untagged
- Tags include essential metadata (environment, project, cost center, etc.)

---

## 10. Parameterize Everything with Variables

### What to Do
1. Use the variables expansion prompt from `docs/demo-1/prompts/06-variables-everywhere.md`
2. Execute the prompt to replace hardcoded values
3. Review the changes and point out:
   - CIDRs replaced with variables
   - Resource names using variables
   - Scaling thresholds parameterized
   - Each variable includes helpful descriptions

### Expected Outcome
Fully parameterized infrastructure code with:
- Expanded `variables.tf` file with comprehensive descriptions
- All hardcoded values replaced with variable references
- Locals used for computed values (e.g., resource names)
- Easy customization for different environments

---

## 11. Deployment and Wrap Up

### What to Do
1. Summarize what was accomplished during the demo
2. Calculate and present the time savings:
   - Compare traditional approach (days of back-and-forth) vs. this demo (minutes to hours)
   - Highlight reduction in ambiguity and errors
3. Optionally trigger the CI/CD pipeline to show it in action

### Key Talking Points
- **Speed**: From vague email to production-ready code in under an hour
- **Quality**: Comprehensive ticket, best practices applied, fully automated pipeline
- **Collaboration**: LLM as a force multiplier, not a replacement for engineering judgment
- **Iteration**: Each refinement step improved the code quality systematically

### Expected Outcome
Audience understands:
- The complete workflow from requirements to deployment
- The practical time and quality benefits of LLM-assisted development
- How to apply this approach to their own infrastructure projects
