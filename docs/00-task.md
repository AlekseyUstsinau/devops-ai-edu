# Business Requirement Task: AWS Infrastructure Deployment

## 1. Background
The business requests a public single-page corporate website to be deployed on **AWS**.  
The website must be scalable, observable, and deployable via automated CI/CD pipelines.  

---

## 2. Application Requirements
- The website is **static** and consists of a single `index.html` page (provided below).  
- The site must be served via **nginx** container.
- The Docker image must be built and pushed to **Amazon ECR**.
- The site will be deployed to a **Kubernetes cluster (EKS)** behind an **Application Load Balancer (ALB)**.

### Provided `index.html`
```html
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AcmeCorp Corporate Site</title>
</head>
<body>
  <h1>Welcome to our demo</h1>
  <p>Hope everything goes smoothly</p>
  <p>All complains could be send here: <a href="mailto:storoj_vasya@sportloto.com">storoj_vasya@sportloto.com</a></p>
</body>
</html>
```

---

## 3. Infrastructure Requirements
The following AWS resources must be created:

- **VPC** with public and private subnets.  
- **EKS cluster** (managed) with **node groups** (EC2 `t3.medium`, min 2, max 5 nodes).  
- **IAM roles and policies** for nodes, ECR access, and CI/CD pipelines.  
- **Elastic Load Balancer (ALB)** for public traffic.  
- **Amazon ECR repository** for Docker images.  
- **S3 + DynamoDB** for Terraform backend (state + locking).  
- **CloudWatch Logs** for application and nginx logs.  
- **CloudWatch Metrics and Alarms**, with **SNS notifications**.

---

## 4. Automation & Scripts
The following scripts and files must be prepared and used during deployment:

1. **Dockerfile** for nginx container with `index.html`.  
2. **Bash scripts**:
   - `build.sh` — build Docker image and push to ECR.  
   - `deploy.sh` — deploy application to EKS using Helm.  
3. **Python script**:
   - `health_check.py` — verify site is accessible and metrics are within expected thresholds.  

These files are **required** for deployment, but their implementation is part of the task.  

---

## 5. CI/CD Requirements
- **GitHub Actions pipeline** must:
  1. Build Docker image and run a local check.
  2. Push the image to ECR.
  3. Deploy application to EKS via Helm.
  4. Run the `health_check.py` to confirm availability.
  5. Notify team via SNS on success or failure.

---

## 6. Deliverables
- Terraform configurations for infrastructure provisioning.  
- Helm chart scaffold for application deployment.  
- Dockerfile and bash/python scripts for build, deploy, and health-check.  
- Provided `index.html` must be used as the site content.  
- Documentation describing setup, deployment steps, and verification.  

---

## 7. Success Criteria
- Application is publicly accessible through the ALB.  
- Logs are collected in CloudWatch and metrics are visible.  
- Deployment is repeatable and automated via CI/CD pipeline.  
- All required scripts and configuration files are present and functional.
