provider "aws" {
  region = var.region
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-server"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-myapp-bucket"

  tags = {
    Environment = var.env
  }
}

