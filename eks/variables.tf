variable "region" {
  type        = string
  description = "aws region."
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for subnet"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key."
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Access Key."
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block."
}

variable "subnet_cidr_ranges" {
  type        = list(string)
  description = "List of cird ranges for subnet"
}