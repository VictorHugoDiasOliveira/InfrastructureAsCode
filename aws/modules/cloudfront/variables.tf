variable "cloudfront_allowed_methods" {
  default = ["GET", "HEAD", "OPTIONS"]
  type    = list(string)
}

variable "cloudfront_cached_methods" {
  default = ["GET", "HEAD", "OPTIONS"]
  type    = list(string)
}

variable "cloudfront_http_version" {
  default = "http2"
  type    = string
}

variable "cloudfront_default_root_object" {
  default = "index.html"
  type    = string
}

variable "cloudfront_price_class" {
  default = "PriceClass_100"
  type    = string
}

variable "bucket_id" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "bucket-logs" {
  type = string
}