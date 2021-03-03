output "vpc" {
  value = module.vpc.vpc
}


output "private_subnets" {
  value = module.subnet.private_subnets
}
