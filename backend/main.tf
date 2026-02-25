terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
  backend "s3" {
    bucket = "backend008-bucket"
    key = "tfstate.txt"
    region = "ap-south-1"
    
  }
}

provider "aws" {
    region = var.region
}