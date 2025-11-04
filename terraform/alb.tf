resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-${var.environment}-alb"
  })
}

resource "aws_lb_target_group" "main" {
  name        = "${var.project_name}-${var.environment}-tg"
  port        = var.container_port
  protocol    = var.lb_protocol
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    enabled             = var.health_check_enabled
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = var.lb_protocol
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-${var.environment}-tg"
  })
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}