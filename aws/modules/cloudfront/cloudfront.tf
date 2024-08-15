resource "aws_cloudfront_origin_access_control" "cloudfront_acl" {
  name = "brasileirinhas cloudfront"

  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_function" "rewrite_uri" {
  name    = "rewrite_uri"
  runtime = "cloudfront-js-1.0"
  comment = "Implement dynamic routes for Next.js"
  publish = true
  code    = <<EOF
function uriSuffix(uri) {
    var len = uri.length - 1;
    for (var a = len; a >= 0; --a) {
        var achar = uri[a];
        if (achar === "/") {
            // Check if the URI already ends with ".html"
            if (uri.endsWith(".html")) {
                // If it does, return the URI as it is
                return "";
            } else {
                // If not, return the URI with ".html" appended
                return ".html";
            }
        } else if (achar === ".") {
            return "";
        }
    }

    // If no slash is found, return "/index.html"
    return "/index.html";
}

function handler(event) {
    var request = event.request;
    var suffix = uriSuffix(request.uri);
    if (suffix.length) {
        // Append the suffix to the request URI
        request.uri += suffix;
    }
    if(request.uri === "/.html"){
        request.uri = "/index.html";
    }
    return request;
}
EOF
}
resource "aws_cloudfront_distribution" "cloudfront" {
  enabled             = true
  is_ipv6_enabled     = false
  price_class         = var.cloudfront_price_class
  comment             = "Cloudfront distribution for ${var.project_name}-${var.environment}"
  default_root_object = var.cloudfront_default_root_object
  http_version        = var.cloudfront_http_version
  logging_config {
    bucket = "${var.bucket-logs}.s3.amazonaws.com" 
    include_cookies = true
  }

  custom_error_response {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 0
  }

  origin {
    origin_id                = var.bucket_id
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_acl.id
    domain_name              = var.domain_name
  }

  default_cache_behavior {
    target_origin_id = var.bucket_id
    compress         = true
    allowed_methods  = var.cloudfront_allowed_methods
    cached_methods   = var.cloudfront_cached_methods
    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.rewrite_uri.arn
    }

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Stage   = var.environment
    Service = var.project_name
  }

  depends_on = [
    aws_cloudfront_distribution.cloudfront
  ]
}


