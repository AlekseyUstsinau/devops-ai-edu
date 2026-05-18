data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source               = "./modules/network"
  project_name         = var.project_name
  environment          = local.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = data.aws_availability_zones.available.names
  create_nat_gateway   = var.create_nat_gateway
  tags                 = local.common_tags
}

module "security" {
  source              = "./modules/security"
  project_name        = var.project_name
  environment         = local.environment
  vpc_id              = module.network.vpc_id
  app_port            = var.app_port
  allowed_cidr_blocks = var.allowed_cidr_blocks
  tags                = local.common_tags
}

module "iam" {
  source              = "./modules/iam"
  project_name        = var.project_name
  environment         = local.environment
  aws_region          = var.aws_region
  ecr_repository_name = var.ecr_repository_name
  tags                = local.common_tags
}

module "storage" {
  source             = "./modules/storage"
  project_name       = var.project_name
  environment        = local.environment
  bucket_name_prefix = var.bucket_name_prefix
  enable_kms         = var.bucket_enable_kms
  tags               = local.common_tags
}

module "compute" {
  source                     = "./modules/compute"
  project_name               = var.project_name
  environment                = local.environment
  application_name           = var.application_name
  app_container_image        = var.app_container_image
  app_cpu                    = var.app_cpu
  app_memory                 = var.app_memory
  app_min_count              = var.app_desired_count
  app_max_count              = var.app_max_count
  app_target_cpu_utilization = var.app_target_cpu_utilization
  app_port                   = var.app_port
  health_check_path          = var.app_health_check_path
  log_retention_days         = var.log_retention_days
  cluster_name               = "${var.project_name}-${local.environment}-ecs-cluster"
  service_name               = "${var.project_name}-${local.environment}-ecs-service"
  aws_region                 = var.aws_region
  vpc_id                     = module.network.vpc_id
  subnet_ids                 = module.network.private_subnet_ids
  alb_security_group_id      = module.security.alb_security_group_id
  ecs_security_group_id      = module.security.ecs_security_group_id
  task_execution_role_arn    = module.iam.ecs_task_execution_role_arn
  task_role_arn              = module.iam.ecs_task_role_arn
  tags                       = local.common_tags
}

