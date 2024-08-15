module "brasileirinhas_frontend_s3" {
  source         = "../modules/cloudfront-s3"
  environment    = var.environment
  bucket_name    = var.project_name
  cloudfront_arn = module.brasileirinhas-cloudfront.cloudfront-arn
}
