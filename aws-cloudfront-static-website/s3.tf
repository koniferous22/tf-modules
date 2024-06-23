resource "aws_s3_bucket" "website_s3_bucket" {
  bucket = var.aws_s3_website_bucket_name
}

resource "aws_s3_bucket" "cloudfront_s3_logs_bucket" {
  bucket = var.aws_cloudfront_s3_logs_bucket
}

resource "aws_s3_bucket_public_access_block" "website_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.website_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_bucket_policy_allow_public_read_access" {
  bucket = aws_s3_bucket.website_s3_bucket.id
  policy = data.aws_iam_policy_document.iam_website_cloudfront_read_access.json
}


// Note - transitive sourcing - i.e. sourcing git module that sources local module, works (at least in tf version 1.8.5 - at the time of writing)
module "object_upload_html" {
  source                 = "../aws-s3-object-upload"
  aws_s3_bucket              = aws_s3_bucket.website_s3_bucket.bucket
  objects_dist_root      = var.website_dist_root
  objects_search_pattern = "**/*.html"
  mime_content_type      = "text/html"
}

module "object_upload_css" {
  source                 = "../aws-s3-object-upload"
  aws_s3_bucket              = aws_s3_bucket.website_s3_bucket.bucket
  objects_dist_root      = var.website_dist_root
  objects_search_pattern = "**/*.css"
  mime_content_type      = "text/css"
}

module "object_upload_js" {
  source                 = "../aws-s3-object-upload"
  aws_s3_bucket              = aws_s3_bucket.website_s3_bucket.bucket
  objects_dist_root      = var.website_dist_root
  objects_search_pattern = "**/*.js"
  mime_content_type      = "text/javascript"
}

module "object_upload_svg" {
  source                 = "../aws-s3-object-upload"
  aws_s3_bucket              = aws_s3_bucket.website_s3_bucket.bucket
  objects_dist_root      = var.website_dist_root
  objects_search_pattern = "**/*.svg"
  mime_content_type      = "image/svg+xml"
}

resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.website_s3_bucket.id

  cors_rule {
    allowed_methods = ["GET", "POST"]
    allowed_origins = var.aws_s3_website_cors_allowed_origins
  }
}