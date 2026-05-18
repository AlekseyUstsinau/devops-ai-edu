resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${var.resource_group_name}-law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
  tags                = var.tags
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_container_app_environment" "env" {
  name                       = var.environment_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
  tags                       = var.tags
}

resource "azurerm_container_app" "app" {
  name                         = var.container_app_name
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  registry {
    server   = azurerm_container_registry.acr.login_server
    identity = "SystemAssigned"
  }

  ingress {
    external_enabled           = true
    allow_insecure_connections = false
    target_port                = var.container_port
    transport                  = "Auto"
  }

  tags = var.tags

  template {
    revision_suffix             = "live"
    min_replicas                = var.min_replicas
    max_replicas                = var.max_replicas
    cooldown_period_in_seconds  = 300
    polling_interval_in_seconds = 30

    http_scale_rule {
      name                = "http-autoscale"
      concurrent_requests = var.http_concurrent_requests
    }

    custom_scale_rule {
      name             = "night-shutdown"
      custom_rule_type = "cron"
      metadata = {
        timezone        = var.timezone
        start           = var.shutdown_cron
        end             = var.startup_cron
        desiredReplicas = "0"
      }
    }

    custom_scale_rule {
      name             = "day-startup"
      custom_rule_type = "cron"
      metadata = {
        timezone        = var.timezone
        start           = var.startup_cron
        end             = var.shutdown_cron
        desiredReplicas = "1"
      }
    }

    container {
      name   = var.container_app_name
      image  = var.app_image
      cpu    = var.container_cpu
      memory = var.container_memory

      env {
        name  = "WEBSITES_PORT"
        value = tostring(var.container_port)
      }
    }
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_container_app.app.identity[0].principal_id
}
