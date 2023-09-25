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
resource "aws_instance" "ec2_example" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = var.security_groups
  tags = {
    Name = var.instance_name
  }
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl = "private"
}