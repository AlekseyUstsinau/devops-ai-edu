# Provision Demo AWS ECS Fargate Environment for Corporate Website (Dev)

## 1. Context
Manager request (urgent): Stand up a minimal, automated AWS environment for the corporate website demo. Delivery deadline: end of current week. This is a one‑environment (dev) demonstration with simplified security/performance to validate deployment workflow integration.
No DNS/custom domain, no TLS, no CDN/WAF, no persistence layers, single ECS service.

## 2. Problem Statement
We currently lack a ready AWS environment to host the demo website in a reproducible manner. Without an automated Terraform-managed baseline (network + compute + container registry), CI/CD cannot validate end-to-end infrastructure deployment. This blocks internal stakeholder review of deployment flow and environment tagging conventions.

## 3. Business Value / Impact
- Enables early validation of infrastructure automation approach.
- Foundation for future production-hardening (TLS, scaling, observability).
- Reduces manual setup risk and accelerates future onboarding.
- Demonstrates baseline IaC patterns (VPC, ECS, ECR, ALB) for internal reuse.

## 4. Scope (Included)
- AWS Region: us-east-1
- VPC (CIDR 10.0.0.0/16) with 2 AZs (us-east-1a, us-east-1b)
- Public subnets (10.0.1.0/24, 10.0.2.0/24) for ALB
- Private subnets (10.0.3.0/24, 10.0.4.0/24) for ECS Fargate tasks
- Internet Gateway + public route tables; private route tables for internal traffic
- ALB (HTTP only, port 80, SG allowing 0.0.0.0/0 inbound)
- ECS Cluster (Fargate), one ECS service (desired count = 1)
- Task definition with minimal CPU/memory (e.g., 0.25 vCPU / 512Mi)
- New ECR repository (latest tag used)
- CloudWatch Logs group (single stream pattern)
- Terraform code (no modules; pure resources) with variables for sizing/tagging
- Remote Terraform state backend (existing S3 bucket: cloud-infrastructure-tfstate-prod in eu-central-1)
- Basic tagging (Environment=dev, Project={{project_name}}, Owner={{owner}}, CostCenter={{cost_center}}, SecurityOwner={{security_owner}})

### Out of Scope
- TLS/HTTPS, custom domain, Route53 hosted zone
- CDN (CloudFront), WAF
- Autoscaling, alarms, dashboards, tracing, container insights
- Databases, caches, stateful storage, backups
- Vulnerability scanning, image signing, secret management, DR/multi-region
- Rollback automation, feature flags, promotion pipeline
- Compliance frameworks (GDPR, SOC2), cost estimation

## 5. Functional Requirements
- FR-1: Provision networking (VPC/subnets/route tables/IGW) matching specified CIDRs.
- FR-2: Deploy ALB reachable via its AWS-managed DNS name over HTTP port 80.
- FR-3: Create ECR repository and push (manually or placeholder) container image tagged latest.
- FR-4: Define ECS service with one running Fargate task using the ECR image (latest).
- FR-5: Expose task via ALB target group (health check path /).
- FR-6: Output ALB DNS name after apply for CI artifact usage.
- FR-7: Store Terraform state remotely using existing S3 backend (read-only bucket path config).
- FR-8: Apply standardized resource tags consistently across all provisioned resources.

## 6. Non-Functional / DevOps Aspects
- Observability: Minimal (default ECS/ALB/CloudWatch metrics only); single log group.
- Security: Open SG ingress (0.0.0.0/0) for demo; minimal task role with only CloudWatch Logs permissions.
- Performance: Single task; no defined latency SLO for demo.
- Reliability: Manual scaling only; default target group deregistration delay.
- Scalability: Parameterized task size and desired count (currently 1).
- Cost: Fargate on-demand only; no optimization performed.
- Compliance: None required; tagging strategy defined for future extension.

## 7. Architecture / Technical Notes
```mermaid
flowchart LR
    subgraph VPC 10.0.0.0/16
      subgraph Public[Public Subnets]
        ALB[Application Load Balancer]
      end
      subgraph Private[Private Subnets]
        ECS[ECS Fargate Service (1 task)]
      end
    end
    ECR[(ECR Repository)]
    ALB --> ECS
    ECS --> ECR
```
Terraform layout proposal:
- infra/terraform/main.tf
- infra/terraform/network.tf
- infra/terraform/ecs.tf
- infra/terraform/alb.tf
- infra/terraform/ecr.tf
- infra/terraform/variables.tf
- infra/terraform/outputs.tf
Backend config referencing: S3 bucket cloud-infrastructure-tfstate-prod (region eu-central-1).

## 8. Data / Config Changes
| Type | Description | Migration | Rollback |
|------|-------------|-----------|----------|
| Terraform State | Remote S3 backend initialization | None (existing bucket) | Remove workspace state |
| ECR Repo | New repository creation | None | Delete repository (manual) |
| ECS Service | New service/task | None | Terraform destroy |

## 9. CI/CD Considerations
- Manual trigger workflow only.
- Separate stages: terraform plan (manual review), then manual apply.
- Image tag: latest only (optionally add SHA later).
- Sequential pipeline (infra then app deploy).
- Export ALB DNS name as workflow output artifact.
- Skip lint/validate steps initially (optional future improvement).

## 10. Acceptance Criteria (BDD)
- Given Terraform configuration is initialized with remote state When terraform plan is executed Then no errors are reported and resources match defined scope.
- Given manual approval of plan When terraform apply completes Then ALB DNS name is output and reachable over HTTP returning 200 for path /.
- Given ECS service is created When checking task status in ECS console Then exactly one RUNNING task exists.
- Given CloudWatch Logs integration When the task emits stdout Then log events appear in the designated log group.
- Given tagging requirements When inspecting any created AWS resource Then required tags (Environment, Project, Owner, CostCenter, SecurityOwner) are present.

## 11. Definition of Done
- [ ] All Acceptance Criteria pass
- [ ] Terraform code committed under infra/terraform/
- [ ] Remote state successfully configured and used
- [ ] ALB DNS name documented in ticket comment or CI artifact
- [ ] Resource tagging verified on at least VPC, ALB, ECS service, ECR
- [ ] Plan and apply both manually triggered and recorded
- [ ] No out-of-scope features inadvertently provisioned

## 12. Risks & Mitigations
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|-----------|
| Open ingress (0.0.0.0/0) | High | Medium | Explicitly documented; convert to locked SG later |
| No TLS | High | Low (demo) | Document non-production status |
| Single task (no HA) | High | Medium | Future scaling via desired_count variable |
| Remote state bucket region mismatch (eu-central-1 vs us-east-1 infra) | Medium | Low | Accept for demo; later unify regions |
| Lack of scanning | High | Low | Add ECR scan-on-push in next iteration |

## 13. Dependencies
- AWS account credentials (with rights to create VPC, ECS, ALB, ECR)
- Existing S3 state bucket: cloud-infrastructure-tfstate-prod
- Team ownership variable value (Team name) to populate tag SecurityOwner / Owner
- Container image source (to push initial latest image)

## 14. OPEN QUESTIONS
1. Provide concrete values for tags: Project, Owner, CostCenter, SecurityOwner.
2. Confirm task CPU/memory exact values (proposed 0.25 vCPU / 512Mi). Accept?
3. Health check path assume / — confirm application responds there?
4. Terraform workspace naming convention (use default or dev-specific)?
5. Should we include output variable for ECS service name as well?

## 15. Additional Notes
Future hardening steps (Phase 2): introduce TLS (ACM), restrict ingress CIDRs, enable autoscaling, add CloudWatch alarms and baseline dashboards, implement ECR scan-on-push, define rollback pattern.
