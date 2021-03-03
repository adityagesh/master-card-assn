module "vpc" {
  source       = "./vpc"
  environment  = var.environment
  project_name = var.project_name
}

module "subnet" {
  source       = "./subnet"
  environment  = var.environment
  project_name = var.project_name
  vpc          = module.vpc.vpc
}

module "gateways" {
  source         = "./gateways"
  environment    = var.environment
  project_name   = var.project_name
  vpc            = module.vpc.vpc
  public_subnets = module.subnet.public_subnets
}

module "routes" {
  source         = "./routes"
  environment    = var.environment
  project_name   = var.project_name
  vpc            = module.vpc.vpc
  public_subnets = module.subnet.public_subnets
  nat_gw         = module.gateways.nat_gw
  internet_gw    = module.gateways.internet_gw
}

