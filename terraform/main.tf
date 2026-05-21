terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  environment = var.environment != "" ? var.environment : terraform.workspace
  tags = merge(var.tags, {
    Environment = local.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  })
}

module "web_service" {
  source                   = "./modules/azure_container_app"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  container_app_name       = var.container_app_name
  environment_name         = var.container_app_environment_name
  acr_name                 = var.acr_name
  app_image                = var.app_image
  container_cpu            = var.container_cpu
  container_memory         = var.container_memory
  container_port           = var.container_port
  acr_sku                  = var.acr_sku
  min_replicas             = var.min_replicas
  max_replicas             = var.max_replicas
  http_concurrent_requests = var.http_concurrent_requests
  shutdown_cron            = var.shutdown_cron
  startup_cron             = var.startup_cron
  timezone                 = var.timezone
  log_retention_days       = var.log_retention_days
  tags                     = local.tags
}

output "container_app_url" {
  description = "Public URL for the deployed Container App."
  value       = module.web_service.container_app_fqdn
}

output "acr_login_server" {
  description = "Azure Container Registry login server."
  value       = module.web_service.acr_login_server
}
