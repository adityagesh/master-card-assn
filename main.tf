module "networking" {
  source       = "./networking"
  environment  = var.environment
  project_name = var.project_name
}


# module "compute" {
#   source       = "./compute"
#   environment  = var.environment
#   project_name = var.project_name
# }
