## Demo Scenario: FROM EMAIL TO DEPLOYED INFRA

The goal of this demo is to show how an LLM can act as a DevOps co-pilot, automatically performing business analysis, converting requirements into structured work items (Jira), and generating production-ready (lol) infrastructure code (Terraform) and CI/CD pipelines (GitHub Actions).

---

### Step 1. The Vague Input (Simulated Email/Slack)

This request is deliberately high-level and incomplete.

Demonstrator Action: Read the high-level request aloud. Stop immediately and ask the audience, "What essential technical details are missing here?" This highlights the informational gap the LLM needs to fill.

> Email from Manager:
>
> "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website.
> It must be scalable and secure enough to handle future load.
> Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines.
> We need the core structure ready by the end of this week. "

Example Prompt/Input: N/A (Initial context only)

Expected LLM Output: N/A

---

### Step 2. Initial Prompt to the LLM: The "Business Analyst" Role

Here, we ask the LLM to ask clarifying questions to fill the informational gaps.

Demonstrator Action: Paste the detailed prompt, emphasizing the LLM's role as an "Architect" and the constraint to ask sequential questions. This saves the human engineer the time of discovery.


> You are an experienced DevOps Architect and Business Analyst. 
> Your task is to transform the following high-level requirement into a complete, ready-to-execute Jira Ticket for a devops engineer to provision infrastructure in AWS. Only infrastructure. Task defenition/service/Build and deploy application will be covered by separate scope. And save this ticket as file.
> 
> Incoming Requirement: an email from my manager
> > "Team, we urgently need to prepare the new environment on AWS for the launch of the corporate website. 
> > It must be scalable and secure enough to handle future load. 
> > Please ensure the entire infrastructure is fully automated and ready to integrate with our CI/CD pipelines. 
> > We need the core structure ready by the end of this week." 
>
> Tech details:
> Here is all details about infrastructure we used to use
> - VPC with public and private subnets.
> - Amazon ECR repository for Docker images.
> - ECS Fargate to deploy
> - Cloudwatch log group for logs
> - S3 Terraform backend
> - Github Action for CICD
> - Region us-east-1
> - Static site with index.html provided
> - Backend for state exist `devops-ai-edu-demo-1-tfstate-839374638189` in `eu-central-1`
>
> I donk care about values such how much AZ or something. If you could cover it bby best practises - do it.
>   
> Your current task: Analyze requirements, details to find any gaps, absents in infrastructure.
> Ask me a series of sequential questions to clarify it in order to create full detailed ready to work jira ticket
> Ask the questions one by one or in logical blocks until you have all the necessary data.

Expected LLM Output: A list of clarifying questions, focused on architecture and security

---

### Step 3. The Question and Answer Session with LLM

The demonstrator provides the answers needed to complete the scope.

Demonstrator Action: Provide concise answers quickly, highlighting that this interaction is typically a 10-minute Slack thread, not hours of research.

---

### Step 4. Final Prompt and Ticket Generation

Now that the LLM has all the information, you ask it to compile the final ticket.

Demonstrator Action: Execute Prompt 2. Emphasize that the LLM is converting unstructured chat data into a structured work item, ready for the engineer.

> Prompt 2:
>
> "Now, using all the collected information, generate the final, structured Jira ticket in markdown format. The ticket must include a clear Title, High-Level Description, a list of detailed Acceptance Criteria (AC), and a Technical Implementation Plan for the engineer. Ensure the AC are written as clear, verifiable checks."
> Create ticket in Jira using instructions

Expected LLM Output: A fully formatted, ready-to-use Jira ticket.

### Step 5. Code Generation (Terraform & CI/CD)

The most important step: translating the ticket into executable code, following all DevOps best practices and refinement prompts.

Demonstrator Action: Show this as an iterative refinement process, demonstrating how the LLM acts as a code-quality assistant, not just a generator.

Example Prompt/Input (Iterative Prompts):

> Prompt 3:
>
> Based on requirenments create terrform code under terraform folder for this ticket, and cicd pipeline.
> Output strictly in the following file structure:
> terraform/00-config.tf
> terraform/01-provider.tf
> terraform/02-variables.tf
> terraform/03-outputs.tf
> terraform/<resource>.tf


Refinement 1 :
> Create CICD pipeline to apply this terraform code. 
> Ensure the GitHub Action correctly points to the terraform/ directory for initialization.
> Ensure you pass all required env variables from github secrets to auth

Refinement 2 (Best Practices): 
> "Review the generated code. Use terraform best practices to adjust code: ensure every resource has the tag Project = 'Demo AI'. Use more tags that help maintain infrastructure. "

Refinement 3: 
> Use variables everywhere possible, set variable with default values in variables file

Expected LLM Output: A set of well-structured and commented code files, fulfilling all best practice requirements.

---

### Step 6. Deployment and Verification (Wrap Up)

**Demonstrator Action:** Conclude the demo by summarizing the total time saved (e.g., "From vague email to production-ready, best-practice Terraform code in **15 minutes**"). This is the final impact statement.

On this step pipeline could be triggered.
