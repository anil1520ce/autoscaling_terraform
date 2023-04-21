provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "autoscaling/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "anil-us-east-1-tfstate"
    encrypt        = true
  }
}