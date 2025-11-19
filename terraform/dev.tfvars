environment   = "dev"
ami_id        = "ami-087d1c9a513324697"
bucket_name   = "my-app-bucket-ganesh-dev"  # your application bucket
instance_type = "t3.micro"

# Terraform backend bucket (state file)
backend_bucket = "terraform-state-ganesh-dev"
aws_region     = "ap-south-1"


