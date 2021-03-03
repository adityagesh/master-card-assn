variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "private_subnets" {}

variable "vpc" {}
variable "alb_target_group" {}
variable "alb_security_group"{}