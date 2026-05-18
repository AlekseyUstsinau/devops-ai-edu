output "container_app_fqdn" {
  description = "Public FQDN for the deployed Container App."
  value       = azurerm_container_app.app.latest_revision_fqdn
}

output "acr_login_server" {
  description = "ACR login server used to push container images."
  value       = azurerm_container_registry.acr.login_server
}

output "container_app_id" {
  description = "ID of the deployed Azure Container App."
  value       = azurerm_container_app.app.id
}

output "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID for telemetry."
  value       = azurerm_log_analytics_workspace.logs.id
}
