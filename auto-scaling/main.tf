terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
    access_key = "xxxxxxx"
    secret_key = "xxxxxxx"
}