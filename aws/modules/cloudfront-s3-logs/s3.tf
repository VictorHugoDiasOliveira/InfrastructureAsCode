# Create s3 bucket for CloudFront
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.environment}"

  tags = {
    Name        = "CloudFront Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Sid" : "AllowCloudFrontServicePrincipalReadOnly",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudfront.amazonaws.com",
        },
        "Action" : "s3:PutObject",
        "Resource" : "arn:aws:s3:::${aws_s3_bucket.bucket.bucket}/*",
        "Condition" : {
          "StringEquals" : {
            "aws:SourceArn" : var.cloudfront_arn
          }
        }
      }
    ]
  })

  depends_on = [
    aws_s3_bucket.bucket
  ]
}
