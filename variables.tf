variable "environment" {
  type        = string
  description = "environment name"
}

variable "project_name" {
  type        = string
  description = "Name of project"
}

variable "region" {
  type        = string
  description = "AWS region to create resources"
}

variable "ami_ids" {
  type        = map(string)
  description = "AWS AMI id based on region"
}


variable "instance_type" {
  type        = string
  description = "AWS EC2 Instance type"
}