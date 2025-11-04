resource "aws_ecs_service" "corp_site" {
  name            = "corp-website-${var.environment}-svc"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.corp_site.arn
  desired_count   = var.corp_site_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private[*].id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.corp_site.arn
    container_name   = "corp-website-${var.environment}-container"
    container_port   = 8080
  }

  depends_on = [
    aws_lb_listener.main,
    aws_vpc_endpoint.ecr_dkr,
    aws_vpc_endpoint.ecr_api,
    aws_vpc_endpoint.logs,
    aws_vpc_endpoint.s3
  ]

  tags = merge(var.default_tags, {
    Name      = "corp-website-${var.environment}-svc"
    Component = "CorpSite"
  })
}

# Target Group for Corporate Site
resource "aws_lb_target_group" "corp_site" {
  name        = "corp-website-${var.environment}-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  tags = merge(var.default_tags, {
    Name      = "corp-website-${var.environment}-tg"
    Component = "CorpSite"
  })
}

# Listener rule removed - corp site is now the default action on the ALB listener