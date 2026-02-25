
resource "aws_s3_access_point" "back_up" {
    name = "my-access-point"
    bucket = var.bucket-name
  
}

