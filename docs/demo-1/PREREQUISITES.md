# Prerequisites & Environment Setup

## Required Tools & Software

Before starting any infrastructure deployment, ensure the following tools are installed and configured:

### 1. **AWS CLI + Python**
```bash
# Install AWS CLI v2
# Windows: Download from https://aws.amazon.com/cli/
# macOS: brew install awscli
# Linux: curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Verify installation
aws --version
python --version  # Required for AWS CLI
```

### 2. **Terraform**
```bash
# Install Terraform
# Windows: choco install terraform
# macOS: brew install terraform
# Linux: Download from https://www.terraform.io/downloads

# Verify installation
terraform --version
```

### 3. **GitHub CLI (optional but recommended)**
```bash
# Install GitHub CLI
# Windows: choco install gh
# macOS: brew install gh
# Linux: Download from https://cli.github.com/

# Verify installation
gh --version
```

### 4. **Git**
```bash
# Usually pre-installed, verify with:
git --version
```

## Required Configuration

### 1. **AWS Credentials Configuration**
```bash
# Configure AWS CLI with your credentials
aws configure

# Or set up profile
aws configure --profile your-profile-name

# Verify configuration
aws sts get-caller-identity
```

### 2. **GitHub Authentication** (if using GitHub CLI)
```bash
# Login to GitHub
gh auth login

# Verify authentication
gh auth status
```

### 3. **Environment Variables for Multiple Engineers**
Each engineer should use their own prefixed environment variables in GitHub Secrets:

**Example for engineer 'ssverchkov':**
- `SSVERCHKOV_AWS_ACCESS_KEY_ID`
- `SSVERCHKOV_AWS_SECRET_ACCESS_KEY`
- `SSVERCHKOV_AWS_REGION`

**Example for engineer 'jdoe':**
- `JDOE_AWS_ACCESS_KEY_ID`
- `JDOE_AWS_SECRET_ACCESS_KEY`
- `JDOE_AWS_REGION`

## Essential Git Setup

### 4. **Create .gitignore File** ⚠️ **CRITICAL - Do this FIRST!**

Before any git activities, create a comprehensive `.gitignore` file to prevent committing sensitive files:

```bash
# Create .gitignore in project root
touch .gitignore  # Linux/macOS
# OR
New-Item .gitignore -Type File  # Windows PowerShell
```

**Required .gitignore Contents:**
```gitignore
# Terraform Files (SECURITY CRITICAL)
*.tfstate
*.tfstate.*
*.tfstate.backup
*.tfplan
*.tfplan.*
.terraform/
.terraform.lock.hcl
crash.log

# VS Code / Visual Studio
.vscode/
.vs/
*.code-workspace
.history/

# IDE Files
.idea/
*.swp
*.swo
*~

# OS Files
.DS_Store
Thumbs.db
desktop.ini

# Environment Files
.env
.env.local
.env.*.local
*.pem
*.key

# Node.js (if applicable)
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Python (if applicable)
__pycache__/
*.py[cod]
*.egg-info/
.pytest_cache/

# Logs
logs/
*.log

# Temporary Files
tmp/
temp/
.tmp
```

## Pre-flight Checklist

Before running any prompts, verify:

- [ ] **`.gitignore` file created** (CRITICAL - prevents committing secrets)
- [ ] AWS CLI installed and configured
- [ ] AWS credentials working (`aws sts get-caller-identity`)
- [ ] Terraform installed
- [ ] Git configured with your identity
- [ ] GitHub repository access configured
- [ ] S3 backend bucket exists (or ready to create)
- [ ] DynamoDB table for state locking exists (or ready to create)
- [ ] GitHub Secrets configured with your engineer prefix
- [ ] Python installed (required for AWS CLI)

## Troubleshooting Common Issues

### AWS CLI Issues
```bash
# If credentials are expired or invalid
aws sts get-caller-identity
# Should return your AWS account info

# If using profiles
aws sts get-caller-identity --profile your-profile-name
```

### Terraform Issues
```bash
# If terraform init fails
terraform version
terraform providers

# Clear cache if needed
rm -rf .terraform
terraform init
```

### GitHub Issues
```bash
# If GitHub authentication fails
gh auth status
gh auth login --web
```

## Security Best Practices

- **Never commit AWS credentials** to version control
- **Use IAM roles** with minimal required permissions
- **Rotate credentials** regularly
- **Use MFA** on AWS accounts when possible
- **Review GitHub Secret** access regularly
- **Use separate AWS accounts** for dev/staging/prod environments