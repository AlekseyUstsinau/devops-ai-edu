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

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.corp_site.arn
  }
}