# Demo 2: Implementation

**Goal:** Show how LLM and Copilot assist in real implementation of infrastructure, containerization, and deployment, creating a full working cycle with automation and verification.

**Link to Demo 1:**
We take the backlog, architecture, and estimates from Demo 1 and proceed to their technical implementation.

---

## Detailed Step-by-Step Demo Plan

### 1. Infrastructure Preparation (Terraform)

**Demonstrator Actions:**
- Create Terraform configurations for AWS (VPC, subnets, security groups, IAM, EKS cluster).
- Use LLM to generate modules and variables.
- Show directory structure and dependencies.

**Example LLM Prompt:**
```plaintext
Generate Terraform configuration for AWS (eu-central-1), based on tickets in tasks folder:

Output strictly in the following file structure:
terraform/00-config.tf
terraform/01-provider.tf
terraform/02-variables.tf
terraform/03-outputs.tf
terraform/<resource>.tf
```

**Expected Artifacts:**
- `main.tf`, `variables.tf`, `outputs.tf`
- `modules/vpc`, `modules/eks` directories
- Working infrastructure after `terraform apply`

### 2. Application Build (Docker)

**Demonstrator Actions:**
- Create a Dockerfile for Nginx with a custom `index.html`.
- Build and test locally (`docker run -p 8080:80`).

**Example LLM Prompt:**
```plaintext
Create a Dockerfile for Nginx:
- Copy a custom index.html generated based on requirements
- Base on official nginx:stable image
- Optimize for minimal size
Output strictly in format:
./Dockerfile
./index.html
```

**Expected Artifacts:**
- `Dockerfile`
- `index.html`
- Local image `acmecorp-nginx:latest`

### 3. Helm Chart for Deployment

**Demonstrator Actions:**
- Create a Helm chart (Deployment, Service, Ingress).
- Configure values: namespace, image, replicas.
- Validate with `helm template`.

**Example LLM Prompt:**
```plaintext
Generate a Helm chart for Nginx with the following structure:
./chart/Chart.yaml
./chart/values.yaml
./chart/templates/deployment.yaml
./chart/templates/service.yaml
./chart/templates/ingress.yaml
Use parameters:
- .Values.image.repository
- .Values.image.tag
- .Values.replicaCount
```

**Expected Artifacts:**
- `chart/` directory with full chart
- Valid output from `helm template ./chart`

### 4. Automation (Bash Scripts)

**Demonstrator Actions:**
- `build.sh` — build and push Docker image to ECR.
- `deploy.sh` — deploy Helm chart to Kubernetes.
- Verify with `kubectl get pods` and `kubectl describe pod`.

**Example LLM Prompt:**
```plaintext
Generate build.sh and deploy.sh:
- build.sh: docker build, docker tag, docker push to ECR
- deploy.sh: helm upgrade --install, pod status check
Output strictly in format:
./scripts/build.sh
./scripts/deploy.sh
```

**Expected Artifacts:**
- `scripts/build.sh`
- `scripts/deploy.sh`
- Published image and deployed application

### 5. Health-Check (Python)

**Demonstrator Actions:**
- Write `healthcheck.py` to check:
  - HTTP 200 on homepage
  - Presence of Prometheus metrics at `/metrics`
- Run and demonstrate exit code.

**Example LLM Prompt:**
```plaintext
Generate healthcheck.py that:
- GET http://example.com/
- Verify status == 200
- GET http://example.com/metrics
- Verify response contains "http_requests_total"
Exit with (1) on error, (0) on success.
Output strictly in format:
./scripts/healthcheck.py
```

**Expected Artifacts:**
- `scripts/healthcheck.py`
- Automated availability check

### 6. Demo 2 Result
- Fully prepared Terraform configurations.
- Docker image built and tested.
- Helm chart created and validated.
- Bash scripts automate build/deploy.
- Python script performs health-check.
- The demonstration highlights how LLM and Copilot accelerate implementation and reduce errors.

---