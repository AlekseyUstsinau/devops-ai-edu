# AWS Support Case Request - ELBv2 Service Enablement

## Case Information
- **Date:** October 30, 2025
- **Account ID:** 746828523917
- **Region:** us-west-2 (primary), tested us-east-1 (same restriction)
- **Service:** Elastic Load Balancing v2 (Application Load Balancer & Network Load Balancer)
- **Severity:** Business - Service impairment

## Issue Summary
AWS account cannot create Application Load Balancers (ALB) or Network Load Balancers (NLB) due to service restriction. Classic Load Balancers work normally.

## Error Details
```
An error occurred (OperationNotPermitted) when calling the CreateLoadBalancer operation: 
This AWS account currently does not support creating load balancers. 
For more information, please contact AWS Support.
```

## Testing Evidence
**Commands Tested:**
```bash
# Application Load Balancer (FAILED)
aws elbv2 create-load-balancer --name "test-alb-restriction-check" \
  --subnets subnet-02b8f058 subnet-b6821bfd --scheme internet-facing --type application

# Network Load Balancer (FAILED)  
aws elbv2 create-load-balancer --name "test-nlb-restriction-check" \
  --subnets subnet-02b8f058 subnet-b6821bfd --scheme internet-facing --type network

# Classic Load Balancer (SUCCESS)
aws elb create-load-balancer --load-balancer-name "test-clb-restriction-check" \
  --listeners "Protocol=HTTP,LoadBalancerPort=80,InstancePort=80" \
  --subnets subnet-02b8f058 subnet-b6821bfd
```

**Service Quotas:** All ELB limits show normal values (20 ALBs, 50 NLBs, etc.)

**Account Status:** 
- Account created recently for demo/education purposes
- Root account access confirmed
- Billing enabled and verified
- Other AWS services (EC2, ECS, VPC, S3) working normally

## Business Impact
- **Project:** DevOps Infrastructure Automation Demo
- **Timeline:** Educational demonstration requiring load balancer functionality
- **Dependencies:** ECS Fargate service deployment depends on ALB for traffic routing
- **Alternative:** Classic ELB lacks required features (target groups, advanced routing)

## Specific Request
Please enable **Elastic Load Balancing v2** service for this account to allow creation of:
1. Application Load Balancers (ALB)
2. Network Load Balancers (NLB)

## Technical Context
- **Infrastructure:** ECS Fargate cluster with containerized static website
- **Architecture:** Internet-facing ALB → ECS Fargate tasks (port 3000)
- **Security Groups:** Configured for HTTP/HTTPS traffic routing
- **VPC Setup:** Public subnets across multiple AZs ready for ALB deployment

## Contact Information
- **Primary Contact:** [Your Name/Email]
- **Phone:** [Your Phone Number]
- **Preferred Contact Method:** Email
- **Timezone:** [Your Timezone]

---

## Support Case Template (Ready to Submit)

**Subject:** Enable ELB v2 Service - Account Restriction Preventing ALB/NLB Creation

**Description:**
Hello AWS Support Team,

I'm requesting enablement of the Elastic Load Balancing v2 service for account 746828523917. Currently, the account cannot create Application Load Balancers or Network Load Balancers due to a service restriction.

**Error Message:**
"This AWS account currently does not support creating load balancers. For more information, please contact AWS Support."

**Testing Details:**
- Both ALB and NLB creation fail with OperationNotPermitted
- Classic ELB works normally
- Tested in multiple regions (us-west-2, us-east-1)
- Service quotas show normal limits

**Business Need:**
This account is used for DevOps education and infrastructure automation demonstrations. The restriction is blocking deployment of a modern ECS Fargate architecture that requires Application Load Balancer functionality.

**Request:**
Please remove the service restriction and enable ELB v2 (ALB/NLB) creation for this account.

Thank you for your assistance.

Best regards,
[Your Name]

---

## Next Steps After Case Submission

1. **Case Tracking:** Save case number for reference
2. **Response Timeline:** Typically 24-48 hours for service enablement requests
3. **Follow-up:** Check case status daily
4. **Testing:** Once resolved, run `terraform apply` to deploy remaining resources
5. **Documentation:** Update demo results with resolution timeline

## Infrastructure Ready for Deployment
- 30/37 resources already deployed successfully  
- 7 ALB-dependent resources waiting for service enablement
- GitHub Actions pipeline configured and ready
- S3 backend operational

**Estimated Full Deployment:** 5-10 minutes after restriction removal