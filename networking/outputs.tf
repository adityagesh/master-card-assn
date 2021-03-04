output "vpc" {
  value = module.vpc.vpc
}


output "private_subnets" {
  value = module.subnet.private_subnets
}

output "public_subnets" {
  value = module.subnet.public_subnets
}

output "alb_target_group" {
  value = module.alb.alb_target_group
}

output "alb_security_group" {
  value = module.alb.alb_security_group
}

output "aws_lb_webserver_dns" {
  value = module.alb.aws_lb_webserver_dns
}