
# Common variables used in every Terraform project
variable "bucket_name" {
  description = "String: The Aws Bucket Name."
  type        = string
}
variable "environment" {
  description = "String: AWS account environment name. e.g.: dev, test, or prod."
  type        = string
}
variable "cloudfront_arn" {
  description = "String: The Cloudfront ARN."
  type        = string
}

