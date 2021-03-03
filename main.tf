module "networking" {
  source       = "./networking"
  environment  = var.environment
  project_name = var.project_name
}


module "compute" {
  source       = "./compute"
  environment  = var.environment
  project_name = var.project_name
  private_subnets = module.networking.private_subnets
  vpc = module.networking.vpc
}
