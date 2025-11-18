
terraform {
  backend "s3" {
    bucket  = "tudumuganesh-1"
    key     = "ec2/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
