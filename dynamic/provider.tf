terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }
  backend "s3" {
    bucket         = "devops-s3-drum"
    key            = "dynamic-demo" # need to chamge every folder for unique track key
    region         = "us-east-1"
    dynamodb_table = "devops-s3-locking"
  }
}

# provide authentication  here dont provide credentials directly here security threats

provider "aws" {
  region = "us-east-1"
}

