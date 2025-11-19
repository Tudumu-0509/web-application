terraform {
  backend "s3" {
    bucket  = "tudumuganesh-1"
    key     = "ec2/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false     # FIX: No uppercase letters
  number  = true
  lower   = true
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-server"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-myapp-bucket-${random_string.suffix.id}"

  tags = {
    Environment = var.env
  }
}
