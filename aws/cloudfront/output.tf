output "bucket-id" {
  value = module.brasileirinhas_frontend_s3.bucket-id
}

output "bucket-arn" {
  value = module.brasileirinhas_frontend_s3.bucket-arn
}

output "bucket-regional-domain-name" {
  value = module.brasileirinhas_frontend_s3.bucket-regional-domain-name
}

output "cloudfront-arn" {
  value = module.brasileirinhas-cloudfront.cloudfront-arn
}