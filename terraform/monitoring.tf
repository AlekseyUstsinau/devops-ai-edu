# CloudWatch Log Group for ECS tasks
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}-${var.environment}"
  retention_in_days = var.log_retention_days

  tags = merge(var.default_tags, {
    Name      = "${var.project_name}-${var.environment}-ecs-logs"
    Component = "CorpSite"
  })
}

# CloudWatch Alarm for ECS task failures
resource "aws_cloudwatch_metric_alarm" "ecs_task_failures" {
  alarm_name          = "${var.project_name}-${var.environment}-ecs-task-failures"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "ServiceEvent"
  namespace           = "AWS/ECS"
  period              = var.alarm_period
  statistic           = "Sum"
  threshold           = var.alarm_failure_threshold
  alarm_description   = "This metric monitors ECS task failures"
  alarm_actions       = []

  dimensions = {
    ServiceName = aws_ecs_service.corp_site.name
    ClusterName = aws_ecs_cluster.main.name
  }

  tags = merge(var.default_tags, {
    Name      = "${var.project_name}-${var.environment}-ecs-task-failures-alarm"
    Component = "CorpSite"
  })
}