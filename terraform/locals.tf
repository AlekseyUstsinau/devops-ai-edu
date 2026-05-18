locals {
  environment = var.environment != "" ? var.environment : terraform.workspace

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = local.environment
      Owner       = var.owner
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
