variable "subscription_id" {
  type        = string
  default     = ""
  description = "Azure subscription ID for the deployment. If empty, provider auth defaults are used."
}

variable "tenant_id" {
  type        = string
  default     = ""
  description = "Azure tenant ID for provider authentication."
}

variable "project_name" {
  type        = string
  default     = "devops-ai-app"
  description = "Project name used for naming and tagging."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Deployment environment identifier. Uses terraform workspace when empty."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags to apply to Azure resources."
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region for deployment."
}

variable "resource_group_name" {
  type        = string
  default     = "staging-rg"
  description = "Resource group name for the staging environment."
}

variable "container_app_name" {
  type        = string
  default     = "staging-web-app"
  description = "Name of the Azure Container App resource."
}

variable "container_app_environment_name" {
  type        = string
  default     = "staging-app-env"
  description = "Container Apps environment name."
}

variable "acr_name" {
  type        = string
  default     = "stagingacr12345"
  description = "Azure Container Registry name for the app image."
}

variable "app_image" {
  type        = string
  default     = "stagingacr12345.azurecr.io/staging-web-app:latest"
  description = "Container image reference in ACR for deployment."
}

variable "container_cpu" {
  type        = number
  default     = 0.25
  description = "CPU units for the container app."
}

variable "container_memory" {
  type        = number
  default     = 0.5
  description = "Memory in GiB for the container app."
}

variable "container_port" {
  type        = number
  default     = 80
  description = "Port exposed by the container app."
}

variable "min_replicas" {
  type        = number
  default     = 0
  description = "Minimum replica count for the Container App."
}

variable "max_replicas" {
  type        = number
  default     = 3
  description = "Maximum replica count for autoscaling."
}

variable "http_concurrent_requests" {
  type        = number
  default     = 50
  description = "Request concurrency threshold for HTTP autoscaling."
}

variable "shutdown_cron" {
  type        = string
  default     = "0 22 * * *"
  description = "Cron expression when the app should scale to zero."
}

variable "startup_cron" {
  type        = string
  default     = "0 7 * * *"
  description = "Cron expression when the app should scale back up."
}

variable "timezone" {
  type        = string
  default     = "UTC"
  description = "Timezone used for scheduled scale rules."
}

variable "log_retention_days" {
  type        = number
  default     = 7
  description = "Retention days for Log Analytics logs."
}

variable "acr_sku" {
  type        = string
  default     = "Basic"
  description = "SKU for Azure Container Registry."
}

variable "backend_resource_group_name" {
  type        = string
  default     = "tfstate-rg"
  description = "Resource group for Terraform backend storage."
}

variable "backend_storage_account_name" {
  type        = string
  default     = "tfstatestaging"
  description = "Storage account name for Terraform remote state."
}

variable "backend_container_name" {
  type        = string
  default     = "tfstate"
  description = "Blob container name for Terraform state."
}

variable "backend_state_key" {
  type        = string
  default     = "staging.terraform.tfstate"
  description = "State file key for the Terraform backend."
}

variable "repository_url" {
  type        = string
  default     = "https://github.com/example/repo.git"
  description = "Git repository URL for CI/CD."
}

variable "repository_branch" {
  type        = string
  default     = "main"
  description = "Branch used to trigger the CI/CD pipeline."
}

variable "pipeline_name" {
  type        = string
  default     = "staging-deploy-pipeline"
  description = "Pipeline name for deployment automation."
}

variable "docker_image_name" {
  type        = string
  default     = "staging-web-app"
  description = "Docker image name stored in ACR."
}

variable "docker_image_tag" {
  type        = string
  default     = "latest"
  description = "Docker image tag used for deployment."
}
