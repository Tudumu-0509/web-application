provider "aws" {
  region = "ap-south-1"
}

module "ec2_module" {
  source        = "./modules/ec2"
  ami_id        = "ami-087d1c9a513324697"
  instance_type = "t3.micro"
  key_name      = "connect"
  instance_name = "My-EC2-Module"
}

output "public_ip" {
  value = module.ec2_module.ec2_public_ip
}

module "ec2_module1" {
  source        = "./modules/ec2"
  ami_id        = "ami-087d1c9a513324697"
  instance_type = "t3.small"
  key_name      = "connect"
  instance_name = "My-EC2-Module1"
}

output "public_ip1" {
  value = module.ec2_module1.ec2_public_ip
}

module "ec2_module2" {
  source        = "./modules/ec2"
  ami_id        = "ami-087d1c9a513324697"
  instance_type = "t3.micro"
  key_name      = "connect"
  instance_name = "My-EC2-Module2"
}

output "public_ip2" {
  value = module.ec2_module2.ec2_public_ip
}
