module "brasileirinhas_frontend_s3_logs" {
  source         = "../modules/cloudfront-s3-logs"
  environment    = var.environment
  bucket_name    = "${var.project_name}-logs"
  cloudfront_arn = module.brasileirinhas-cloudfront.cloudfront-arn
}