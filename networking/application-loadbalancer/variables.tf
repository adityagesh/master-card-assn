variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc" {}
variable "public_subnets" {}
variable "CIDR_block_all_traffic" {
  type    = list
  default = ["0.0.0.0/0"]
}