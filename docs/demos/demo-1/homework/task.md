# 🚀 Homework Task: From Vague Request to Working Infrastructure


## 📋 Assignment

Transform the business request below into production-ready infrastructure using AI tools (LLMs and GitHub Copilot).

## 📧 Business Request

```text
Subject: Quick staging environment for a simple service

Hi team,

We need to quickly stand up a temporary staging environment for a small service. 
It must be highly available and support horizontal scaling. Keep costs low (use 
free tier where possible) and implement an automatic stop during nights to save 
money. This is for short-lived testing and should be easy to tear down.

Please provision infrastructure in AWS and add a CI/CD pipeline that can deploy 
updates. Prioritize reliability and low cost.

Thanks,
Manager
```

---

### ✅ Requirements

- **Infrastructure**: Use Terraform for AWS infrastructure provisioning
- **CI/CD**: Implement GitHub Actions pipeline for automated deployment
- **Documentation**: 
  - Save all prompts used in `docs/demo-1-hw/prompts/`
  - Create architecture diagram showing your solution
  - Include impact summary with cost optimization and security recommendations

### ⚠️ Important Notes

- **GitHub Secrets**: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are pre-configured
- **Security**: Never hard-code credentials in your code
- **🔴 CRITICAL**: Destroy all AWS resources when finished to avoid unexpected charges!

---

**Good luck! 🎯**
