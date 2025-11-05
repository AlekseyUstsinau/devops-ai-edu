resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-${var.environment}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(var.default_tags, {
    Name      = "${var.project_name}-${var.environment}-cluster"
    Component = "ECS"
  })
}