
terraform {
  backend "s3" {
    bucket = "terraform-backend-ganesh-bucket-001"
    key    = "ec2/${terraform.workspace}/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
