
resource "aws_instance" "my-server" {
    ami = "ami-0317b0f0a0144b137"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.mysg.id]
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo yum install nginx -y
    sudo systemctl start nginx
    EOF
    tags = {
      Name = "my-server"
    }
  
}