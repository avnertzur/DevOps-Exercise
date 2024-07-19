variable "vpc_name" {
  description = "The Name of the VPC."
  type        = string
}

variable "aws_region" {
  description = "AWS Region to deploy the VPC in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_private_subnets" {
  description = "List of private subnets to create in VPC"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "List of public subnets to create in VPC"
  type        = list(string)
}

variable private_ip {
  description = "Personal IP to connect with"
  type        = list(string)
}

variable tags {
  description = "Tags to add to all resources"
  type        = map
  default     = {
    Terraform = "true"
    DevopsMaster = "true"
  }
}

variable "keypair_name" {
  description = "keypair_name"
  type        = string
  default     = "devops_kp"
}
