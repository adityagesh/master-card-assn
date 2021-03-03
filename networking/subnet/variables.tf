variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc" {}

variable "CIDR_pvt" {
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    description = "List of private subnet CIDR blocks"
}

variable "CIDR_pub" {
    type        = list(string)
    # default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    default     = ["10.0.4.0/24"]
    description = "List of public subnet CIDR blocks"
}
