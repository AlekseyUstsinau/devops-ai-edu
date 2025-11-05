resource "aws_ecs_task_definition" "corp_site" {
  family                   = "corp-website-${var.environment}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.corp_site_task_cpu
  memory                   = var.corp_site_task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name  = "corp-website-${var.environment}-container"
      image = "${aws_ecr_repository.main.repository_url}:${var.corp_site_image_tag}"

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      healthCheck = {
        command     = ["CMD-SHELL", "wget --no-verbose --tries=1 --spider http://localhost:${var.container_port}${var.health_check_path} || exit 1"]
        interval    = var.container_health_check_interval
        timeout     = var.container_health_check_timeout
        retries     = var.container_health_check_retries
        startPeriod = var.container_health_check_start_period
      }

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "corp-site"
        }
      }

      essential = true
    }
  ])

  tags = merge(var.default_tags, {
    Name      = "corp-website-${var.environment}-task"
    Component = "CorpSite"
  })
}