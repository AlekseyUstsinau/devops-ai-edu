# Demo 4: Cloud Tools Exploration – CLI vs Direct Cloud Access

**Goal:** Demonstrate different types of cloud tools and how LLM interacts with them: CLI/file-based vs direct cloud access.

---

## Detailed Step-by-Step Demo Plan

### 1. CLI & File-Based Tools

**Demonstrator Actions:**
- Introduce Cloud Code or GitHub Copilot generating local configs and scripts.
- Demonstrate `terraform init/apply` and AWS CLI automation via LLM.

**Example LLM Prompt:**
```plaintext
Generate Terraform configuration for a VPC with one subnet and a security group, and a Bash script that runs terraform init and terraform apply
```

**Expected Outcome:**
- Files ready for local execution.
- Shows LLM can generate commands, but execution is via CLI.

### 2. Direct Cloud Access Tools

**Demonstrator Actions:**
- Introduce AmazonQ (or equivalent) with direct AWS API access.
- Demonstrate direct actions without intermediate scripts:
  - Show AWS billing
  - Create S3 bucket with versioning
  - Snapshot RDS database

**Example LLM Prompt:**
```plaintext
Ask AmazonQ to create a new S3 bucket with versioning and public access
```

**Expected Outcome:**
- Action executed directly in the cloud.
- Clear understanding of CLI vs direct resource access.

### 3. Comparison

**Demonstrator Actions:**
- Discuss pros/cons of CLI/file vs direct cloud access tools.

**Example LLM Prompt:**
```plaintext
Compare CLI/file tools (Cloud Code, Copilot) vs direct cloud access tools (AmazonQ). Which tasks suit each type?
```

**Expected Outcome:**
- Understanding of tool differences and LLM acceleration in both workflows.
