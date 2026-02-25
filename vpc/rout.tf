
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
    tags = {
      Name="my-rt"
    }
  
}

resource "aws_route_table_association" "rt-a" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.public.id
  
}