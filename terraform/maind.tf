resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "${var.environment}-ec2"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.environment}"
  acl    = "private"

  tags = {
    Name        = "${var.environment}-bucket"
    Environment = var.environment
  }
}
