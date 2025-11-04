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
    port = 80
  }
  
  # Health check configuration
  corp_site_health_check = {
    path                = "/health"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}