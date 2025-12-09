# 🏗️ Phase 2: AI-Driven Infrastructure as Code

## ⚠️ Constraint

Generate **ALL** Terraform code using AI. Manual coding is only allowed for:

- ❌ Fixing syntax errors AI cannot resolve
- 🔧 Adjusting AI-generated configurations that don't meet requirements
- 📝 Creating the prompting strategy document

---

## 🎯 Your Task

### 1️⃣ Develop a Prompting Strategy

- 📋 Document your approach to prompting AI for infrastructure code
- 💡 Include example prompts that worked well and those that didn't
- 🔄 Explain how you iterated on prompts to improve output

### 2️⃣ Generate Terraform Infrastructure

- 🧩 Use AI to generate modular Terraform code for your architecture
- 💾 Implement proper state management (remote backend)
- ✅ Follow Terraform best practices (modules, variables, outputs)
- 🌍 Include environment separation (dev/staging/prod)

### 3️⃣ Code Quality Requirements

- 🏷️ All resources must have appropriate tags
- 🔐 Implement least-privilege IAM policies
- 📊 Use data sources where appropriate
- ✔️ Include proper variable validation
- 💬 Add comprehensive comments explaining design decisions

---

## 📦 Deliverables

- [ ] **Complete Terraform codebase** (organized in modules)
- [ ] **Prompting strategy document**
- [ ] **README** with deployment instructions
- [ ] **terraform.tfvars.example** files
