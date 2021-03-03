module "autoscaling-group" {
  source             = "./autoscaling-group"
  environment        = var.environment
  project_name       = var.project_name
  vpc                = var.vpc
  private_subnets    = var.private_subnets
  alb_target_group   = var.alb_target_group
  alb_security_group = var.alb_security_group
}
