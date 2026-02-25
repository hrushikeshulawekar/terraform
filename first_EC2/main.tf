terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "my-server" {
    ami = var.ami
    instance_type = var.type

    tags = {
      Name = "my-server"
    }
}