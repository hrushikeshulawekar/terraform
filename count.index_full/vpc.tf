
resource "aws_vpc" "main" {
    count = 3
    cidr_block = "10.${count.index}.0.0/16"
    tags = {
      Name = "my-vpc-${count.index}"
    }
  
}

resource "aws_internet_gateway" "main" {
    count = 3
    vpc_id = element(aws_vpc.main[*].id, count.index)
    tags = {
      Name = "my-gateway-${count.index}"
    }
  
}

resource "aws_subnet" "main" {
    count = 3
    vpc_id = element(aws_vpc.main[*].id, count.index)
    cidr_block = "10.${count.index}.${count.index}.0/24"
    tags = {
        Name = "my-subnet-${count.index}"
    }
  
}

resource "aws_route_table" "main" {
    count = 3
    vpc_id = element(aws_vpc.main[*].id, count.index)
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = element(aws_internet_gateway.main[*].id, count.index)
    }
    tags = {
        Name = "my-RT-${count.index}"
    }
  
}

resource "aws_route_table_association" "main" {
    count = 3
    route_table_id = element(aws_route_table.main[*].id, count.index)
    subnet_id = element(aws_subnet.main[*].id, count.index)
  
}