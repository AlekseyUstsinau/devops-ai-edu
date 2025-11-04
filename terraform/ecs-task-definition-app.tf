resource "aws_ecs_task_definition" "corp_site" {
  family                   = "${var.project_name}-${var.environment}-corp-site-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.corp_site_task_cpu
  memory                   = var.corp_site_task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name  = "${var.project_name}-${var.environment}-corp-site-container"
      image = "${aws_ecr_repository.main.repository_url}:${var.corp_site_image_tag}"

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      healthCheck = {
        command     = ["CMD-SHELL", "wget --no-verbose --tries=1 --spider http://localhost:80/health || exit 1"]
        interval    = 30
        timeout     = 5
        retries     = 3
        startPeriod = 60
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
    Name      = "${var.project_name}-${var.environment}-corp-site-task"
    Component = "CorpSite"
  })
}