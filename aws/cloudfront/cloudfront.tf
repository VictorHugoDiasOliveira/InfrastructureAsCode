module "brasileirinhas-cloudfront" {
  source = "../modules/cloudfront"

  bucket_id    = module.brasileirinhas_frontend_s3.bucket-id
  domain_name  = module.brasileirinhas_frontend_s3.bucket-regional-domain-name
  environment  = var.environment
  project_name = var.project_name
  bucket-logs  = module.brasileirinhas_frontend_s3_logs.bucket-id
}
