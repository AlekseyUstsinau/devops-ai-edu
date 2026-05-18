variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group for the staging environment."
}

variable "location" {
  type        = string
  description = "Azure region where resources are deployed."
}

variable "container_app_name" {
  type        = string
  description = "Name of the Azure Container App instance."
}

variable "environment_name" {
  type        = string
  description = "Container Apps environment name."
}

variable "acr_name" {
  type        = string
  description = "Azure Container Registry name."
}

variable "app_image" {
  type        = string
  description = "Container image reference in ACR to deploy."
}

variable "container_cpu" {
  type        = number
  default     = 0.25
  description = "CPU units for the container."
}

variable "container_memory" {
  type        = number
  default     = 0.5
  description = "Memory in GiB for the container."
}

variable "container_port" {
  type        = number
  default     = 80
  description = "Port exposed by the container application."
}

variable "acr_sku" {
  type        = string
  default     = "Basic"
  description = "SKU for Azure Container Registry."
}

variable "min_replicas" {
  type        = number
  default     = 0
  description = "Minimum number of Container App replicas to allow."
}

variable "max_replicas" {
  type        = number
  default     = 3
  description = "Maximum number of Container App replicas for auto-scale."
}

variable "http_concurrent_requests" {
  type        = number
  default     = 50
  description = "HTTP concurrent request threshold for auto-scaling."
}

variable "shutdown_cron" {
  type        = string
  default     = "0 22 * * *"
  description = "Cron expression when the environment should scale to zero."
}

variable "startup_cron" {
  type        = string
  default     = "0 7 * * *"
  description = "Cron expression when the environment should scale back up."
}

variable "timezone" {
  type        = string
  default     = "UTC"
  description = "Timezone used by the scheduled scale rules."
}

variable "log_retention_days" {
  type        = number
  default     = 7
  description = "Retention period in days for Log Analytics data."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags applied to Azure resources managed by this module."
}
