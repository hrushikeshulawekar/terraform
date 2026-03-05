
resource "aws_instance" "main" {
    count = 3
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ element(aws_security_group.main[*].id, count.index) ]
    associate_public_ip_address = true
    subnet_id = element(aws_subnet.main[*].id, count.index)
    tags = {
      Name = "my-server-${count.index}"
    }
  
}