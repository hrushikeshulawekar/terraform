
resource "aws_instance" "my-server" {

    ami = var.ami
    instance_type = var.type
    tags = {
      Name = "my-server"
    }
  
}