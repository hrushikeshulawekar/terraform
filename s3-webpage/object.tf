resource "aws_s3_object" "my-object-1" {
    bucket = var.bucket
    source = "index.html"
    key = "web.html"
    content_type = "text/html"
  
}

resource "aws_s3_object" "my-object-2" {
    bucket = var.bucket
    source = "style.css"
    key = "web.css"
    content_type = "text/html"
  
}