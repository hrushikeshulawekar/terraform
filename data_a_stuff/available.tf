
data "aws_subnet" "default" {
    tags = {
      Name = "d-public-1"
    }
  
}
data "aws_security_group" "default" {
    tags = {
        Name = "my-sg"
    }
  
}