terraform {
  required_providers {
    aws = {
      version = ">= 3.30.0"
      source = "hashicorp/aws"
    }
  }
  required_version = "~>0.12"
}

provider "aws" {
  region = var.region
}