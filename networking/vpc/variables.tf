variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for VPC"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}