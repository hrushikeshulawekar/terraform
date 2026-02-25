
resource "aws_instance" "main" {
    ami = var.ami
    instance_type = var.instance_type
    count = length(aws_security_group.main)
    subnet_id = data.aws_subnet.sub.id
    vpc_security_group_ids = [ element(aws_security_group.main[*].id, count.index) ]
    tags = {
      Name = "server-${count.index}"
    }

    
  
}