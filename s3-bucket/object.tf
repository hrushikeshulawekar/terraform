
resource "aws_s3_object" "my_object" {
    bucket = var.bucket-name
    source = "data.txt"
    key = "myfile.txt"
  
}