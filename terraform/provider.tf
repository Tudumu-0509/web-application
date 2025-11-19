terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Enable workspace usage
  backend "local" {}
}

provider "aws" {
  region = var.aws_region
}

