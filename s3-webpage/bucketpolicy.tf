resource "aws_s3_bucket_policy" "public_policy" {
  bucket = var.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.my-bucket.arn}/*"
      }
    ]
  })
}
