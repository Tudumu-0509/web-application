terraform {
  backend "s3" {
    bucket  = var.backend_bucket
    key     = "terraform.tfstate"
    region  = var.aws_region
    encrypt = true
  }
}

variable "backend_bucket" {
  type        = string
  description = "S3 bucket to store Terraform state"
}

variable "aws_region" {
  type        = string
  description = "AWS region for the S3 bucket"
}
