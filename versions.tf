terraform {
  required_version = ">= 1.5.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.12.0"
    }
    archive = {
      version = ">= 2.4.0"
    }
  }

  backend "s3" { }
}

provider "aws" {
  region = var.aws_region
}