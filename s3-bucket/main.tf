provider "aws" {

    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "my-bucket" {
    bucket = var.bucket-name
  
}