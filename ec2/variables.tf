variable "region" {
  type    = string
  default = "us-west-2"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key."
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Access Key."
}

variable "ami" {
  type    = string
  default = "ami-03f65b8614a860c29"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair" {
  type    = string
  default = "key"
}

variable "security_groups" {
  type    = list(string)
  default = ["launch-wizard-1"]
}

variable "instance_name" {
  type    = string
  default = "ec2_example"
}

variable "bucket_name" {
  description = "name bucket"
  type        = string
  default     = "terraformstate8941c707"
}