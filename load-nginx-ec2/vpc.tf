
resource "aws_vpc" "test-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "test-vpc"
    }
  
}

resource "aws_internet_gateway" "test-igw" {
    vpc_id = aws_vpc.test-vpc.id
    tags = {
      Name = "test-igw"
    }
  
}

resource "aws_subnet" "test-public" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "test-public"
    }
  
}

resource "aws_subnet" "test-private" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = "test-private"
    }
  
}

resource "aws_route_table" "test-rt" {
    vpc_id = aws_vpc.test-vpc.id
    route {
        gateway_id = aws_internet_gateway.test-igw.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
      Name="test-rt"
    }
  
}

resource "aws_route_table_association" "ra" {
    route_table_id = aws_route_table.test-rt.id
    subnet_id = aws_subnet.test-public.id
  
}

resource "aws_security_group" "test-sg" {
    vpc_id = aws_vpc.test-vpc.id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "test-sg"
    }
  
}
