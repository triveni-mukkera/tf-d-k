terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  # backend "s3" {
  #   bucket = "value"
  #   key = 
  #   region = "value"
  #   dynamodb_table = "value"
  # }
}

provider "aws" {
  # Configuration options
  region = "eu-west-2"
}