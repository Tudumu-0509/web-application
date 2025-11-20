variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
 
}

variable "key_name" {
  description = "Key pair name"
  type        = string
 
}

variable "instance_name" {
  description = "EC2 Instance name tag"
  type        = string
  
}
