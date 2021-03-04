module "networking" {
  source       = "./networking"
  environment  = var.environment
  project_name = var.project_name
}


module "compute" {
  source             = "./compute"
  environment        = var.environment
  project_name       = var.project_name
  private_subnets    = module.networking.private_subnets
  public_subnets     = module.networking.public_subnets
  vpc                = module.networking.vpc
  alb_target_group   = module.networking.alb_target_group
  alb_security_group = module.networking.alb_security_group
  region             = var.region
  ami_ids            = var.ami_ids
  instance_type      = var.instance_type
}
