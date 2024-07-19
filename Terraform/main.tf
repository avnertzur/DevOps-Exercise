terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.42.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets = ["10.42.1.0/24"]
  public_subnets  = ["10.42.2.0/24"]

  tags = {
    Terraform = "true"
    DevopsMaster = "true"
  }
}