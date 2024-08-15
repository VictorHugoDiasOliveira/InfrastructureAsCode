
output "bucket-id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket-regional-domain-name" {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}

output "bucket-arn" {
  value = aws_s3_bucket.bucket.arn
}

