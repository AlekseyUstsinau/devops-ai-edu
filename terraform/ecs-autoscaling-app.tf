# ECS Auto Scaling Configuration for Corporate Site
# This file contains auto scaling configuration for the corporate website

# Auto Scaling Target for Corporate Site
resource "aws_appautoscaling_target" "corp_site" {
  max_capacity       = var.corp_site_max_capacity
  min_capacity       = var.corp_site_min_capacity
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.corp_site.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  tags = merge(var.default_tags, {
    Name      = "${var.project_name}-${var.environment}-corp-site-autoscaling-target"
    Component = "CorpSite"
  })
}

# CPU-based scaling policy (target > 60%)
resource "aws_appautoscaling_policy" "corp_site_cpu" {
  name               = "${var.project_name}-${var.environment}-corp-site-cpu-scaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.corp_site.resource_id
  scalable_dimension = aws_appautoscaling_target.corp_site.scalable_dimension
  service_namespace  = aws_appautoscaling_target.corp_site.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = var.corp_site_cpu_scale_threshold
    scale_in_cooldown  = 300
    scale_out_cooldown = 60
  }
}

# Future enhancement: Memory-based scaling policy can be added if needed