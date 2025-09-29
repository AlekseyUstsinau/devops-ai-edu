# Demo 3: Testing & Deployment (CI/CD and Quality Gate)

**Goal:** Demonstrate how **LLM and Copilot** accelerate testing, deployment, and monitoring automation by creating a robust **CI/CD pipeline (GitHub Actions)**, ensuring quality control, and system stability. This completes the full DevOps cycle.

---

## Detailed Step-by-Step Demo Plan

### 1. CI/CD Pipeline Creation (GitHub Actions)

**Demonstrator Actions:**
- Ask LLM/Copilot to generate the complete GitHub Actions workflow file (`.github/workflows/main.yml`).
- Show how to authenticate with **AWS** using OIDC or access keys (via secrets).
- Implement the build and deployment scripts from Demo 2 (`./scripts/build.sh`, `./scripts/deploy.sh`) directly into the workflow.
- Demonstrate setting up GitHub **Secrets** for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_SNS_ARN`.

**Example LLM Prompt:**
```plaintext
Generate a complete GitHub Actions workflow for CI/CD which apply terraform code from `./terraform` folder with manual trigger
- Use 'aws-actions/configure-aws-credentials' for authentication.
- The pipeline must execute the following steps in order:
  1. plan
  2. apply based on plan
```

**Example LLM Prompt:**
```plaintext
Generate a complete GitHub Actions workflow for CI/CD:
- Trigger on 'push' to the 'main' branch.
- Use 'aws-actions/configure-aws-credentials' for authentication.
- The pipeline must execute the following steps in order:
  1. Run './scripts/build.sh' (to build/push to ECR).
  2. Run './scripts/deploy.sh' (to deploy Helm to EKS).
  3. Run './scripts/healthcheck.py' (as the quality gate).
- Add a final step to send an **SNS notification** (via AWS CLI or a dedicated action) to `AWS_SNS_ARN` with the final status of the job (SUCCESS/FAILURE).
```

**Expected Artifacts:**
- A functional `.github/workflows/main.yml` file.
- The pipeline runs successfully after a commit.

### 2. Quality Gate Automation (Health-Check Script)

**Demonstrator Actions:**
- Show the final version of `scripts/healthcheck.py`.
- Explain how it acts as the Quality Gate: it verifies the application's basic functionality and observability.
  - Check for HTTP 200 response on the homepage.
  - Check for the presence of Prometheus metrics (`http_requests_total`) at the `/metrics` endpoint (as required for observability).
- Demonstrate how a non-zero exit code (1) will fail the pipeline.

**Expected Artifacts:**
- Successful run of `scripts/healthcheck.py` with Exit code 0.

### 3. Monitoring & Notification Verification (SNS/CloudWatch)

**Demonstrator Actions:**
- Briefly show the basic CloudWatch Dashboard and an associated Alarm (e.g., watching Nginx 5xx errors) provisioned by Terraform in Demo 2.
- Show the configured SNS Topic and the email subscription.
- Demonstrate the successful email notification received from AWS SNS after the GitHub Actions workflow completes.

**Expected Artifacts:**
- An email notification confirming the deployment status (Success).
- Logs and basic metrics visible in CloudWatch.

### 4. Full End-to-End Cycle Demonstration

**Demonstrator Actions:**
- Make a small, visible change to the `index.html` file (e.g., update the footer text).
- Commit and push the change to the main branch.
- Navigate to the GitHub Actions tab and monitor the running workflow.
- Highlight the execution flow: Build → Push → Deploy → Health-Check (Quality Gate).
- Access the application using the ALB DNS Name to verify the updated content.
- Confirm the successful receipt of the final SNS notification.

**Expected Result:**
- The updated corporate website is publicly accessible.
- The deployment is fully automated, tested, and verifiable via external notification.

---

### 5. Demo 3 Result
- Fully functional CI/CD pipeline (GitHub Actions).
- Automated quality gate via `healthcheck.py`.
- System stability confirmed through observability checks and SNS notifications.
- The demonstration successfully highlights how LLM and Copilot accelerate the final, crucial phase of deployment and quality assurance.
