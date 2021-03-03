variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc" {}

variable "public_subnets" {}
variable "nat_gw" {}
variable "internet_gw" {}

variable "destination_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
