terraform {
  backend "s3" {
    bucket = "ganeshtudumu-s3bucket-123458"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}
