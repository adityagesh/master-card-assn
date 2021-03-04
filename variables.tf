variable "environment" {
  default     = "development"
  type        = string
  description = "environment name"
}

variable "project_name" {
  default     = "mastercard-assgn"
  type        = string
  description = "Name of project"
}

variable "region" {
  default     = "us-east-2"
  type        = string
  description = "AWS region to create resources"
}

variable "ami_ids" {
  type = map(string)
  default = {
    "us-east-2" : "ami-08962a4068733a2b6",
    "us-east-1" : "ami-042e8287309f5df03"
    description = "AWS AMI id based on region"
  }
}
