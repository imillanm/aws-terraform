terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidr_ranges)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr_ranges[count.index]
  availability_zone = var.availability_zone
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "test-cluster"
  cluster_version = "1.21"
  vpc_id          = aws_vpc.vpc.id
  subnet_ids      = aws_subnet.subnets

  eks_managed_node_groups = {
    node-group = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = ["t2.micro"]
      subnets          = aws_subnet.subnets

    }
  }

}