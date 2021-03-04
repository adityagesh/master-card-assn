variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "private_subnets" {}
variable "public_subnets" {}
variable "region" {}
variable "ami_ids" {}
variable "vpc" {}
variable "alb_target_group" {}
variable "alb_security_group" {}

variable "CIDR_block_all_traffic" {
  type    = list
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}


variable "asg_config" {
  type = object({
    desired_capacity = number
    max_size         = number
    min_size         = number
  })
  default = {
    desired_capacity = 1
    max_size         = 3
    min_size         = 1
  }
}


locals {
  user_data = <<USERDATA
#!/bin/bash -xe
cd /tmp
wget https://raw.githubusercontent.com/adityagesh/master-card-assn/main/scripts/startup.sh
chmod +x startup.sh
./startup.sh
USERDATA
}