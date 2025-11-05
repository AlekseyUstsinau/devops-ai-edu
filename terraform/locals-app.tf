locals {
  # Corporate Site naming helpers
  corp_site_name_prefix = "${var.project_name}-${var.environment}-corp-site"

  # Common tags for corporate site resources
  corp_site_tags = merge(var.default_tags, {
    Component = "CorpSite"
    Service   = "StaticWebsite"
  })

  # Container configuration
  corp_site_container = {
    name = "${local.corp_site_name_prefix}-container"
    port = var.container_port
  }

  # Health check configuration
  corp_site_health_check = {
    path                = var.health_check_path
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }
}