# 🚀 Phase 3: CI/CD Pipeline

## ⚠️ Constraint

Generate **ALL** pipeline code using AI. Manual coding is only allowed for:

- ❌ Fixing syntax errors AI cannot resolve
- 🔧 Adjusting AI-generated configurations that don't meet requirements
- 📝 Creating pipeline documentation

---

## 🎯 Your Task

### 1️⃣ Infrastructure CI/CD

- 🔄 Automated terraform plan on pull requests
- ✅ Automated terraform apply on merge to main
- 🔍 Drift detection and alerts
- 💰 Cost estimation in PR comments
- 🔐 Security scanning (tfsec, checkov, or similar)

### 2️⃣ Application Deployment Pipeline (choose one sample app)

- 🏗️ Build and test automation
- 📦 Container image building and scanning
- 🚢 Automated deployment to Kubernetes/ECS/App Service
- 🎯 Blue-green or canary deployment strategy
- ⏪ Automated rollback on failure

### 3️⃣ Pipeline Requirements

- ⚙️ Use GitHub Actions, GitLab CI, or similar
- 🔑 Implement proper secrets management
- 👮 Add approval gates for production
- 🧪 Include automated testing (unit, integration)
- 📢 Set up notifications (Slack/email)

---

## 📦 Deliverables

- [ ] **CI/CD configuration files**
- [ ] **Documentation of pipeline stages**
- [ ] **Example of successful pipeline run** (screenshots/logs)