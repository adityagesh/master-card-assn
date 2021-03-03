variable "environment" {
  default = "development"
  type    = string
  description = "environment name"
}

variable "project_name" {
    default = "mastercard-assgn"
    type = string
    description = "Name of project"
}

variable "region" {
    default = "us-east-2"
    type = string
    description = "AWS region to create resources"
}