terraform {
  backend "s3" {
    bucket         = "terraformstate8941c707"
    key            = "calabs/production/us-west-2/rslab/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}