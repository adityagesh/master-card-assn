output "vpc" {
  value = module.vpc.vpc
}


output "private_subnets" {
  value = module.subnet.private_subnets
}

output "alb_target_group" {
  value = module.alb.alb_target_group
}

output "alb_security_group" {
  value = module.alb.alb_security_group 
}