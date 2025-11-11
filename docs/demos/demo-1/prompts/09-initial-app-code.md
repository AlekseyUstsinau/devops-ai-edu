# Prompt 09: Initial App Code (Docker + Incremental Terraform)

ROLE: Senior Infrastructure & App Engineer.

TASK: Produce initial code to deploy the static site container using existing infra Terraform root.

OUTPUT STRUCTURE (ADDITIONS ONLY):
app/
  Dockerfile
  README.md            # brief build & run instructions
terraform/             # existing root from infra demo (DO NOT duplicate backend/provider)
  ecs-task-definition-app.tf   # if task tefenition not exist already
  ecs-service-app.tf           # if not exist already
  app-security-groups.tf       # (only if separate SG needed to restrict ingress from ALB SG)
  ecs-autoscaling-app.tf       # (added later in autoscaling step; placeholder comment ok now)
  locals-app.tf                # (optional) naming helpers, or extend existing locals
  # updates inside existing 02-variables.tf (append new variables) – do NOT create a second variables file
  # updates inside existing 03-outputs.tf (append outputs)

CONSTRAINTS:
- Reuse backend & provider blocks (NO new 00-config.tf / 01-provider.tf).
- Reference existing ECS cluster, VPC subnets, ALB / target group via variables or data sources (no hard-coded IDs).
- Use nginx:alpine base image for security and size optimization.
- Container must run as non-root user (create appuser with UID 1001).
- Container should expose port 8080 (non-privileged port).
- Configure container health check (HTTP path "/health").
- Ensure security groups allow ALB -> ECS communication on port 8080.
- Start with minimal new variables; extend later.
- Tags: use merge(var.default_tags, { Component = "CorpSite" }).
- Keep resource names clearly separated (e.g., aws_ecs_task_definition.corp_site, aws_ecs_service.corp_site).

OUTPUT STYLE:
- Provide only new files' full content and appended blocks for modified existing files.
