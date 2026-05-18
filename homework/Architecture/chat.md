You are the solution architect.
Your job is to design the complete solution as if you are writing an internal architecture proposal that will be implemented using Terraform.

CONSTRAINS:
- Use Azure services only
- Prefer serverless / free tier where possible
- highly available across multiple AZs
- horizontal scaling automatically
- automatically shut down at night and start in the morning
- Must be easy to destroy (ephemeral staging)
- Assume this is a simple containerized web service (Dockerized app)
- CI/CD must deploy automatically on push to main branch
- Prioritize low cost and operational simplicity over complexity

DELIVER:
  ARCHITECTURE DIAGRAM (use ASCII diagram)
   - Show all Azure components and connections

  ARCHITECTURE DOCUMENT
   For each component explain:
   - Why it was chosen
   - How it satisfies HA, scaling, and low cost
   - Free tier considerations
   - How nightly shutdown works

  Azure SERVICES USED (table)
   Columns: Service | Purpose | Free Tier Use | Cost Optimization Note

TERRAFORM INPUT PARAMETERS
   Provide a COMPLETE list of variables Terraform will need including:
   - instance types
   - autoscaling limits
   - region
   - VPC CIDR
   - subnet CIDRs
   - ECS/EKS/Fargate choices
   - storage sizes
   - schedules for shutdown/startup
   - pipeline configuration values

CI/CD
   - Which Azure service
   - Pipeline stages
   - How image is built and deployed

Explain EXACTLY
   - how resources are stopped and started automatically.
   - how this staging environment can be safely destroyed with Terraform.

Be opinionated.
Make concrete choices.
Do NOT give multiple options.
Provide production-grade reasoning.
____________________________________________________________________________________________________________

Now generate the Terraform module structure and example main.tf and variables.tf files based on this design.