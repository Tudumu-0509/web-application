variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-087d1c9a513324697"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = "connect"
}

variable "instance_name" {
  description = "EC2 Instance name tag"
  type        = string
  default     = "My-EC2-Server"
}
