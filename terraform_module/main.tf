provider "aws" {
    region = "ap-south-1"
  
}

module "ec2" {
    source = "./module/ec2"
    ami = "ami-0317b0f0a0144b137"
    instance_type = "t3.micro"
    Name = "my-ec2"
}