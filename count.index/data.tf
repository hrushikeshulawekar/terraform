
data "aws_subnet" "sub" {
    tags = {
      Name = "d-public-1"
    }
  
}

data "aws_vpc" "vpc" {
    tags = {
      Name = "Default"
    }
  
}

resource "aws_security_group" "main" {
    vpc_id = data.aws_vpc.vpc.id
    count = 3
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
      Name = "security-g-${count.index}"
    }
  
}

