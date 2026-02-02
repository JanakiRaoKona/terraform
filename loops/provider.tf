terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }
}

# provide authentication  here dont provide credentials directly here security threats

provider "aws" {
  region = "us-east-1"
}
 
