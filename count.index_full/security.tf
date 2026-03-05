resource "aws_security_group" "main" {
    count = 3
    vpc_id = element(aws_vpc.main[*].id, count.index)
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [ "0.0.0.0/16" ]
        protocol = "tcp"
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ "0.0.0.0/16" ]
        protocol = "-1"
    }
    
    tags = {
        Name = "sg-${count.index}"
    }
  
}