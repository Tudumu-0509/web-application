terraform {
  backend "s3" {
    bucket = "ganeshtudumu-s3bucket-1234581"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}
