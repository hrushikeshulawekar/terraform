
resource "aws_instance" "test-ec2" {
    ami = "ami-0317b0f0a0144b137"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.test-sg.id]
    associate_public_ip_address = true
    subnet_id = aws_subnet.test-public.id
    user_data = <<-EOF
    #!/bin/bash
    sudo yum install nginx -y
    sudo systemctl start nginx
    EOF
    tags = {
      Name="test-ec2"
    }
  
}