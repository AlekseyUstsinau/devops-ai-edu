resource "aws_ecs_task_definition" "corp_site" {
  family                   = "corp-site-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([{
    name      = "corp-site-container"
    image     = "${aws_ecr_repository.corp_site.repository_url}:${var.container_image_tag}"
    essential = true

    # Security: Run container as non-root user (already configured in Dockerfile)
    user = "101:101"

    # Security: Read-only root filesystem (enhanced container security)
    readonlyRootFilesystem = true

    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
      protocol      = "tcp"
    }]

    healthCheck = {
      command     = ["CMD-SHELL", "wget --quiet --tries=1 --spider http://localhost${var.health_check_path} || exit 1"]
      interval    = 30
      timeout     = 5
      retries     = 3
      startPeriod = 10
    }

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
        "awslogs-region"        = var.region
        "awslogs-stream-prefix" = "ecs"
      }
    }

    # Mount points for writable directories (required for read-only root filesystem)
    mountPoints = [
      {
        sourceVolume  = "cache"
        containerPath = "/var/cache/nginx"
        readOnly      = false
      },
      {
        sourceVolume  = "run"
        containerPath = "/var/run"
        readOnly      = false
      }
    ]

    environment = []
    secrets     = []
  }])

  # Volumes for writable directories
  volume {
    name = "cache"
  }

  volume {
    name = "run"
  }

  tags = {
    Name        = "corp-site-dev-task"
    Environment = "dev"
    CostCenter  = "engineering"
    Project     = "corp-site"
    ManagedBy   = "terraform"
  }
}

resource "aws_ecs_service" "corp_site" {
  name            = "corp-site-dev-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.corp_site.arn
  desired_count   = var.ecs_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.private[0].id]
    security_groups  = [aws_security_group.ecs_task.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "corp-site-container"
    container_port   = var.container_port
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  depends_on = [
    aws_lb_listener.http,
    aws_iam_role_policy.ecs_task_execution_ecr,
    aws_iam_role_policy.ecs_task_execution_logs
  ]

  tags = {
    Name        = "corp-site-dev-service"
    Environment = "dev"
    CostCenter  = "engineering"
    Project     = "corp-site"
    ManagedBy   = "terraform"
  }
}
