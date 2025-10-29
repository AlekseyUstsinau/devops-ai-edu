# Prompt 03: FinOps Optimization & Autoscaling

## Context
You are a FinOps Engineer reviewing an AWS infrastructure codebase. Best practices and security hardening passes have ALREADY been completed. This pass focuses on **cost optimization and resource efficiency**.

**IMPORTANT**: Best practices and security hardening passes have ALREADY been completed. This pass focuses on **cost optimization and resource efficiency**.

## Objective
**MODIFY THE ACTUAL FILES** to implement cost savings - do not just describe what should change. Enable autoscaling where applicable. Do NOT add new AWS services without explicit approval.

## Scope Areas

### 1. Resource Right-Sizing
- Adjust over-provisioned CPU/memory allocations in ECS task definitions
- Reduce desired_count to safe minimums for non-production
- Set appropriate container resource limits

### 2. Cost-Efficient Configurations
- Standardize CloudWatch log retention (30 days max)
- Add cost allocation tags
- Optimize ECR image retention policies

### 3. Autoscaling Implementation
- Implement ECS Service autoscaling with target tracking
- Add variables for min/max capacity and target CPU utilization
- Configure scale-in and scale-out policies with appropriate cooldowns

### 4. CI/CD Optimization
- Add conditional workflow execution (skip if no changes)
- Implement caching strategies
- Add path filters to prevent unnecessary runs

## Expected Actions

**YOU MUST:**
1. **Read all files** in .github/workflows/, terraform/, and app/ directories
2. **Identify cost inefficiencies** and over-provisioned resources
3. **Modify the actual files** to implement optimizations
4. **Add autoscaling configurations** where missing
5. **Calculate approximate cost savings** for each change

**DO NOT:**
- Only provide diffs or suggestions - actually edit the files
- Add new AWS services without approval
- Reduce resources to levels that would impact reliability

## Output Format

After making all file modifications, provide a summary report with these sections:

### 1. Cost Optimization Summary
| Optimization | Current Cost | Optimized Cost | Monthly Savings (USD) | Risk Level |

### 2. Resource Changes Applied
| File | Resource | Before | After | Reasoning |

### 3. Autoscaling Configuration
- **Service**: [ECS/Other], **Metric**: [CPU/Memory]
- **Min/Max Capacity**: [values], **Target**: [percentage]
- **Cooldowns**: Scale-in [seconds], Scale-out [seconds]

### 4. Cost Savings Breakdown
- **Compute**: $[amount]/month - [description]
- **Storage**: $[amount]/month - [description]
- **CI/CD**: $[amount]/month - [description]
- **Total Estimated Savings**: $[amount]/month (~[percentage]% reduction)

*Note: Estimates based on typical AWS pricing. Actual savings may vary.*

### 5. Additional Optimization Opportunities (Optional - Default NO)
- [ ] Reserved Instances or Savings Plans
- [ ] Fargate Spot for dev/test
- [ ] S3 Intelligent-Tiering

## Constraints
- **No new AWS services** without explicit approval
- Maintain minimum reliability and performance requirements
- Keep safe margins for production workloads
