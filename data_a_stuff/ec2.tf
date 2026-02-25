
resource "aws_instance" "demo" {

    ami = "ami-0317b0f0a0144b137"
    instance_type = "t3.micro"
    subnet_id = data.aws_subnet.default.id
    vpc_security_group_ids = [ data.aws_security_group.default.id ]
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo yum install nginx -y
    sudo systemctl start nginx
    tags = {
    EOF
    tags = {
        Name = "demo"
      }
  
}